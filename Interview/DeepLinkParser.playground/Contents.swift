import Foundation
import Combine


print("zomato://order/34532?a=b".components(separatedBy: "zomato://"))
let yourTargetUrl = URL(string:"zomato://order/34532?a=b")!

var dict = [String:String]()
print(yourTargetUrl.host)
print(yourTargetUrl.pathComponents)

print(yourTargetUrl.query)


enum DeepLinkType: String {
    case order
    case dineout
}

struct DeeplinkOrderData {
    let orderId: String
    let info: [AnyHashable: Any]?
}

struct DeeplinkDineoutData {
    let orderId: String
    let info: [AnyHashable: Any]?
}

enum DeepLinkTypeAndData {
    case order(data: DeeplinkOrderData?)
    case dineout(data: DeeplinkDineoutData?)
}

protocol DeeplinkService {
var deepLinkPublisher: AnyPublisher<DeepLinkTypeAndData, never>
    func handleDeeplink(_ link: String) -> DeepLinkTypeAndData?
}

final class ConcreteDeeplinkService: DeeplinkService {

    init() {}

    func handleDeeplink(_ link: String) -> DeepLinkTypeAndData?  {
        guard self.isValidZomatoLink(link),
              let url = URL(string: link) else {
            return nil
        }

        guard let host = url.host,
              let deepLinkType = DeepLinkType(rawValue: host) else { return nil }

        guard url.pathComponents.count == 2,
              !url.pathComponents[1].isEmpty else { return nil }



        return
}



    private func isValidZomatoLink(_ link: String) -> Bool {
        let components = link.components(separatedBy: "zomato://")
        guard components.count >= 2,
              !components[1].isEmpty else { return false }
        return true
    }
}


private extension DeepLinkType {
    func getDeepLinkData(orderId: String, info: String?) -> DeepLinkTypeAndData {
        switch self {
        case .dineout:

        case .order:
        }
    }
}

