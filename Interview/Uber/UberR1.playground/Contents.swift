//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


protocol CacheManager {
    func getImageForUrl(_ url: URL, result: ((UIImage?) -> Void))
    func saveImageForUrl(_ url: String, result: ((Bool) -> Void))
}

final class ConcreteCacheManager: CacheManager {

    func getImageForUrl(_ url: URL, result: ((UIImage?) -> Void)) {

    }

    func saveImageForUrl(_ url: String, result: ((Bool) -> Void)) {

    }
}

protocol ImageDownloader {
    func imageForUrl(_ url: URL, result: @escaping ((UIImage?) -> Void))
    func imageForUrl(_ url: String, result: @escaping ((UIImage?) -> Void))
}

final class PRImageDownloader: ImageDownloader {

//    private var dataTaskStorage: [String: URLSessionDataTask] = [:]

    static let shared: ImageDownloader = PRImageDownloader()

    private let cacheManager: CacheManager

    private var session: URLSession =  {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }()

    private init() {
        self.cacheManager = ConcreteCacheManager()
    }

    func imageForUrl(_ url: URL, result: @escaping ((UIImage?) -> Void)) {
        self.downloadImageForUrl(url, result: result)
    }

    func imageForUrl(_ url: String, result: @escaping ((UIImage?) -> Void)) {
        guard let _url = URL(string: url) else {
            result(nil)
            return
        }
        self.downloadImageForUrl(_url, result: result)
    }

    private func downloadImageForUrl(_ url: URL, result: @escaping ((UIImage?) -> Void)) {

//        if let inProgressDataTask = dataTaskStorage[url.absoluteString] {
//
//            inProgressDataT
//
//            return
//        }

        let dataTask = session.dataTask(with: url) { data, response,
            error in
            guard error == nil,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                result(nil)
                return
            }
            guard let data = data,
                  let image = UIImage(data: data) else {
                result(nil)
                return
            }
            result(image)
        }
//        self.dataTaskStorage[url.absoluteString] = dataTask
        dataTask.resume()
    }
}


class MyViewController : UIViewController {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 150, y: 200, width: 200, height: 200)
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
        PRImageDownloader.shared.imageForUrl(url) { [weak self] image in
            guard let image = image else { return }
            self?.imageView.image = image
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
