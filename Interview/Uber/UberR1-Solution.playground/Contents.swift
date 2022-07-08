//: A UIKit based Playground for presenting user interface
  
import UIKit
import Combine
import PlaygroundSupport

protocol CacheManager {
    // Returns the image associated with a given url
    func imageforUrl(_ url: URL) -> UIImage?
    // Inserts the image of the specified url in the cache
    func insertImage(_ image: UIImage?, for url: URL)
    // Removes the image of the specified url in the cache
    func removeImage(for url: URL)
    // Removes all images from the cache
    func removeAllImages()
    // Accesses the value associated with the given key for reading and writing
    subscript(_ url: URL) -> UIImage? { get set }
}

public final class PRCacheManager: CacheManager {

    private lazy var imageCache: NSCache<NSURL, UIImage> = {
        let cache = NSCache<NSURL, UIImage>()
        cache.countLimit = config.countLimit
        return cache
    }()

    private let lock = NSLock()
    private let config: Config

    public struct Config {
        public let countLimit: Int
        public let memoryLimit: Int

        public static let defaultConfig = Config(countLimit: 100,
                                                 memoryLimit: 1024 * 1024 * 100) // 100 MB
    }

    public init(config: Config = Config.defaultConfig) {
        self.config = config
    }

    public subscript(_ url: URL) -> UIImage? {
        get {
            return imageforUrl(url)
        }
        set {
            return insertImage(newValue, for: url)
        }
    }

    func imageforUrl(_ url: URL) -> UIImage? {
        lock.lock()
        defer { lock.unlock() }

        // search for image data
        return imageCache.object(forKey: url as NSURL)
    }

    func insertImage(_ image: UIImage?, for url: URL) {
        guard let image = image else { return removeImage(for: url) }
        lock.lock()
        defer { lock.unlock() }
        imageCache.setObject(image, forKey: url as NSURL, cost: 1)
    }

    func removeImage(for url: URL) {
        lock.lock()
        defer { lock.unlock() }
        imageCache.removeObject(forKey: url as NSURL)
    }

    func removeAllImages() {
        lock.lock()
        defer { lock.unlock() }
        imageCache.removeAllObjects()
    }
}

protocol ImageLoader: AnyObject {
    func imageForUrl(_ url: URL) -> AnyPublisher<UIImage?, Never>
}

public final class PRImageLoader: ImageLoader {

    static let shared: ImageLoader = PRImageLoader()

    private var cacheManager: CacheManager

    private init(cacheManager: CacheManager = PRCacheManager()) {
        self.cacheManager = cacheManager
    }

    private lazy var backgroundQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 5
        return queue
    }()

    func imageForUrl(_ url: URL) -> AnyPublisher<UIImage?, Never> {
        if let image = cacheManager[url] {
            print("From Cache")
            return Just(image).eraseToAnyPublisher()
        }

        print("Network request")

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { (data, response) -> UIImage? in return UIImage(data: data) }
            .catch { error in return Just(nil) }
            .handleEvents (receiveOutput: {[unowned self] image in
                guard let image = image else { return }
                 self.cacheManager[url] = image
            }).print("Image loading \(url):")
            .subscribe(on: backgroundQueue)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

class MyViewController : UIViewController {

    private var disposables = Set<AnyCancellable>()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 50, y: 200, width: 200, height: 200)
        imageView.backgroundColor = .blue
        return imageView
    }()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(self.imageView)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://picsum.photos/200"
        PRImageLoader.shared.imageForUrl(URL(string: url)!)
            .sink { [weak self] image in
                guard let image = image else { return }
                self?.imageView.image = image
            }.store(in: &self.disposables)

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            PRImageLoader.shared.imageForUrl(URL(string: url)!)
                .sink { [weak self] image in
                    guard let image = image else { return }
                    self?.imageView.image = image
                }.store(in: &self.disposables)
        }
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
