//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        
        // screen view
        let viewFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .white
        self.view = view

        // new view
        let squareFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let squareView = UIView(frame: squareFrame)
        squareView.backgroundColor = .black
        view.addSubview(squareView)

       // MARK: - view animation
//        UIView.animate(withDuration: 3.0, animations: {
//            squareView.backgroundColor = .orange
//            squareView.frame = CGRect(x: 150, y: 150, width: 100, height: 100)
//        },
//            completion:
//        { (_) in
//            squareView.backgroundColor = .black
//            squareView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        })
        
        // MARK: - Transform view animation
        UIView.animate(withDuration: 2.0, animations:  {
            squareView.backgroundColor = .orange

            let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            let rotateTransform = CGAffineTransform(rotationAngle: .pi*(-1))
            let translateTransform = CGAffineTransform(translationX: 200, y: 200)

            let comboTransform = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)

            squareView.transform = comboTransform
        })
        {
            (_) in
            UIView.animate(withDuration: 2.0, animations: {
                squareView.transform = CGAffineTransform.identity
            })
        }
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
