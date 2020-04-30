//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        // painting
        let paintingFrame = CGRect(x: 100, y: 100, width: 200, height: 250)
        let paintingView = UIView(frame: paintingFrame)
        paintingView.backgroundColor = .black
        
        // flare
        let flareFrame = CGRect(x: 0, y: 0, width: 700, height: 20)
        let flare = UIView(frame: flareFrame)
        flare.backgroundColor = .white
        
        // blur
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)

        blurView.frame = paintingView.bounds
        blurView.autoresizingMask = [ .flexibleWidth, .flexibleHeight]
//        self.view.insertSubview(blurView, at: 0)
//        blurView.alpha = 0.8

        
        // set up scene
        view.addSubview(paintingView)
        paintingView.addSubview(flare)
        paintingView.addSubview(blurView)
        let rotateTransform = CGAffineTransform(rotationAngle: .pi/6)
        flare.transform = rotateTransform
        
        
        
        // animate
        UIView.animate(withDuration: 1.5, animations: {
            let translateTransform = CGAffineTransform(translationX: 0, y: paintingView.frame.height)
            flare.transform = translateTransform
        })
        {
            (_) in UIView.animate(withDuration: 1.5, animations: {
//                let rotateTransform = CGAffineTransform(rotationAngle: .pi/6)
                let translateTransform = CGAffineTransform(translationX: 0, y: -paintingView.frame.height)
                flare.transform = translateTransform.concatenating(rotateTransform)
            })
        }
        
        
        
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
