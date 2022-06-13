//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let container = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
// XCPShowView("container", view: container)  // -> deprecated

let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0))
view.backgroundColor = UIColor.green
container.addSubview(view)

UIView.animate(withDuration: 5) {
    view.center = CGPoint(x: 75.0, y: 75.0)
}


class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view

        let testView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0, height: 0))
        testView.backgroundColor = UIColor.green
        view.addSubview(testView)

        let start: CGPoint = CGPoint(x: 100, y: 100)

        /*
        UIView.animate(withDuration: 5) {
            testView.center = CGPoint(x: 75.0, y: 75.0)
        }
         */

        let newViewWidth: CGFloat = 200

        /*
        UIView.animate(withDuration: 5) { //1
            testView.frame = CGRect(x: 0, y: 0, width: newViewWidth, height: newViewWidth)
            testView.center =  CGPoint(x: 100, y: 100)
        }
         */

        /*
        UIView.animate(withDuration: 5.0, //1
            delay: 0.0, //2
                       usingSpringWithDamping: 0.3, //3
                       initialSpringVelocity: 0.2, //4
                       options: UIView.AnimationOptions.curveEaseOut, //5
            animations: ({ //6
            testView.frame = CGRect(x: 0, y: 0, width: newViewWidth, height: newViewWidth)
            testView.center = CGPoint(x: 100, y: 100)
        }), completion: nil)
         */

        /*
        let animator = UIViewPropertyAnimator(duration:0.3, curve: .linear) { //1
            testView.frame = CGRect(x: 0, y: 0, width: newViewWidth, height: newViewWidth)
            testView.center = CGPoint(x: 100, y: 100)
        }
        animator.startAnimation() //2
         */

        UIView.animateKeyframes(withDuration: 5, //1
          delay: 0, //2
          options: .calculationModeLinear, //3
          animations: { //4
            UIView.addKeyframe( //5
              withRelativeStartTime: 0.25, //6
              relativeDuration: 0.25) { //7
                  testView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY) //8
            }

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                testView.center = CGPoint(x: self.view.bounds.width, y: start.y)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                testView.center = start
            }
        })

    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
