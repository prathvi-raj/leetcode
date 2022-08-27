//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

struct UserProfileModel {
    let name: String
}

protocol EventProtocol {
    var name: String { get set }
    var params: [String: Any] { get set }
}


@propertyWrapper
struct Event: EventProtocol {
    var name: String
    var params: [String: Any] = [:]

    var wrappedValue: Event {
        return Event(name: name,
                     params: params)
    }
}

// Helper init methods
extension Event {

    init(pageValue: String) {
        self.init(name: EventName.screenVisit,
                  params: [ParameterName.screen: pageValue])
    }

    init(targetValue: String) {
        self.init(name: EventName.screenVisit,
                  params: [ParameterName.screen: targetValue])
    }

    init(screenValue: String) {
        self.init(name: EventName.screenVisit,
                  params: [ParameterName.screen: screenValue])
    }

    init(clickValue: String) {
        self.init(name: EventName.clickEvent,
                  params: [ParameterName.click: clickValue])
    }
}


// Mock Events
enum EventName {
    static let screenVisit = "Screen Visit"
    static let clickEvent = "Click Event"
}

enum ParameterName {
    static let screen = "screen_name"
    static let click = "click_target"
}

// FeatureOne
enum FeatureOneEvents {
    @Event(pageValue: "featureOne")
    static var screen: Event

    @Event(targetValue: "tappedFeatureOneButton")
    static var buttonClick: Event
}

// FeatureTwo
enum FeatureTwoEvents {
    @Event(pageValue: "featureTwo")
    static var screen: Event

    @Event(targetValue: "tappedFeatureTwoButton")
    static var buttonClick: Event
}



protocol AnalyticsEventsLoggerProtocol {
  func setUserProperties(user: UserProfileModel)
  func trackEvent(event: EventProtocol)
}

// Firebase
class FirebaseEventLogger: AnalyticsEventsLoggerProtocol {

    func setUserProperties(user: UserProfileModel) {
     // init SDK and set user properties
   }

   func trackEvent(event: EventProtocol) {
     // add implementation of tracking events
       print(event.params)
   }
}

// Mixpanel
class MixpanelEventLogger: AnalyticsEventsLoggerProtocol {

    func setUserProperties(user: UserProfileModel) {
        // set user properties
    }

    func trackEvent(event: EventProtocol) {
        // add implementation of tracking events

        print(event.params)
    }
}


protocol AnalyticsManagerProtocol {
   func setUp()
   func trackEvent(_ event: EventProtocol, params: [String: Any])
}

class AnalyticsManager: AnalyticsManagerProtocol {
    static let shared = AnalyticsManager()
    var loggers: [AnalyticsEventsLoggerProtocol] = []

    func setUp() {
     // Setup all the Analytics SDK

        let firebaseEventLogger = FirebaseEventLogger()
        let mixpanelEventLogger = MixpanelEventLogger()

        loggers.append(firebaseEventLogger)
        loggers.append(mixpanelEventLogger)
    }

    func trackEvent(_ event: EventProtocol,
                    params: [String: Any] = [:]) {
        // add extra params to event
        // hit event from all tracking SDK's
        loggers.forEach({ logger in
            logger.trackEvent(event: event)
        })
    }
}


final class MyViewController : UIViewController {
    override func loadView() {
        AnalyticsManager.shared.setUp()

        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Without Params
        AnalyticsManager.shared.trackEvent(FeatureOneEvents.screen)
        // With Params
        AnalyticsManager.shared.trackEvent(FeatureOneEvents.screen,
                                          params:["source": "Tabs"])
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
