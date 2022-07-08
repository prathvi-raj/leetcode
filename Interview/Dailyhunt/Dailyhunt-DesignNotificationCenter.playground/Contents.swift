import UIKit
import Darwin

struct CDNotification {
    let name: String
    let userInfo: [AnyHashable: Any]?
}

struct CDObserver {
    let name: String
}

struct CDObservera {
    let name: Int
}

protocol CDNotificationCenterProtocol: AnyObject {
    func postNotification(name: String,
                          object: Any?,
                          userInfo: [AnyHashable: Any]?)

    func addObserverWithName(_ name: String,
                             object: Any?,
                             queue: OperationQueue?,
                             completion: ((CDNotification) -> Void))
    func removeObserver(name: String)
}

final class CDNotificationCenter:  CDNotificationCenterProtocol {
    static let shared: CDNotificationCenter = CDNotificationCenter()

    private var notificationStorage: [String: CDNotification] = [:]

    private init() {}


    private var queue = DispatchQueue(label: "CDNotificationCenterProtocol.queue",
                                      qos: .default,
                                      attributes: .concurrent)

    private var _observerDictionary: [String: [CDObserver]] = [:]
    private var observerDictionary: [String: [CDObserver]] {
        get {
            var map = [String: [CDObserver]]()
            queue.async {
                map = self._observerDictionary
            }
            return map
        }set {
            queue.sync(flags: .barrier, execute: {
                self._observerDictionary = newValue
            })
        }
    }

    func postNotification(name: String, object: Any?, userInfo: [AnyHashable : Any]?) {
        notificationStorage[name] = CDNotification(name: name,
                                                   userInfo: userInfo)
    }

    func addObserverWithName(_ name: String,
                             object: Any?,
                             queue: OperationQueue?,
                             completion: ((CDNotification) -> Void)) {
        guard let notification = notificationStorage[name] else {
            assertionFailure("Don't have the notification")
            return
        }

        let currentObserver = CDObserver(name: name)

        if observerDictionary[name] == nil {
            observerDictionary[name] = [currentObserver]
        } else {
            observerDictionary[name]?.append(currentObserver)
        }
        completion(notification)
    }

    func removeObserver(name: String) {
        observerDictionary.removeValue(forKey: name)
    }
}

let aa = CDNotificationCenter.shared

class VCA  {
    let name: String = "peace"

    init() {
        self.addObserver()
    }

    func addObserver() {
        aa.addObserverWithName(name,
                               object: self,
                               queue: nil) { _ in

            print("got Notification")
        }
    }
}

class B {

    init() {
        aa.postNotification(name: "peace", object: self, userInfo: ["A": 1])
    }
}


let bb = CDNotificationCenter.shared

let b = B()
let a = VCA()






