import UIKit

public enum VPAlertAnimationType {
    case appearance
    case apperenceWithScale
    case popapFromTop
    case popapFromRight
    case popapFromBottom
    case popapFromLeft
}

public class VPAlertAnimate {
    
    let view: UIView
    let parentView: UIView
    
    public var animateDuration = VPAlertConstants.animateDuration
    public var animeateScale = VPAlertConstants.animeateScale
    public var animationType: VPAlertAnimationType? = nil
    
    init(view: UIView, parentView: UIView){
        self.view = view
        self.parentView = parentView
    }
    
    //MARK: animateIn
    
    func animateIn(type: VPAlertAnimationType? = nil) {
        guard let type = type else { return }
        self.animationType = type
        guard let animationType = self.animationType else { return }
        
        switch animationType {
        case .appearance:
            animateInAppearance(duration: animateDuration)
        case .apperenceWithScale:
            animateInApperenceWithScale(duration: animateDuration,x: animeateScale, y: animeateScale)
        case .popapFromTop:
             animateInPopap(duration: animateDuration, x: 0, y: -parentView.frame.size.height)
        case .popapFromRight:
            animateInPopap(duration: animateDuration, x: parentView.frame.size.width, y: 0)
        case .popapFromBottom:
            animateInPopap(duration: animateDuration, x: 0, y: parentView.frame.size.height)
        case .popapFromLeft:
            animateInPopap(duration: animateDuration, x: -parentView.frame.size.width, y: 0)
        }
        
    }
    
    private func animateInPopap(duration: TimeInterval,x: CGFloat, y:CGFloat){
        view.transform = CGAffineTransform(translationX: x, y: y)
        
        UIView.animate(withDuration: duration) {
            self.view.transform = CGAffineTransform.identity
        }
    }
    
    private func animateInAppearance(duration: TimeInterval){
        view.alpha = 0
        
        UIView.animate(withDuration: duration) {
            self.view.alpha = 1
        }
    }
    
    private func animateInApperenceWithScale(duration: TimeInterval, x: CGFloat, y:CGFloat) {
        view.alpha = 0
        view.transform = CGAffineTransform.init(scaleX: x, y: y)
        
        UIView.animate(withDuration: duration) {
            self.view.alpha = 1
            self.view.transform = CGAffineTransform.identity
        }
    }
    
    //MARK: animateOut
    
    func animateOut(type: VPAlertAnimationType? = nil) {
        let type = type ?? animationType
        guard let animationType = type else { return }
        
        switch animationType {
        case .appearance:
            animateOutAppearance(duration: animateDuration)
        case .apperenceWithScale:
            animateOutApperenceWithScale(duration: animateDuration,x: animeateScale, y: animeateScale)
        case .popapFromTop:
             animateOutPopap(duration: animateDuration, x: 0, y: -parentView.frame.size.height)
        case .popapFromRight:
            animateOutPopap(duration: animateDuration, x: parentView.frame.size.width, y: 0)
        case .popapFromBottom:
            animateOutPopap(duration: animateDuration, x: 0, y: parentView.frame.size.height)
        case .popapFromLeft:
            animateOutPopap(duration: animateDuration, x: -parentView.frame.size.width, y: 0)
        }
        
    }
    
    private func animateOutPopap(duration: TimeInterval,x: CGFloat,y: CGFloat) {
        UIView.animate(withDuration: duration,
                       animations: {
                        self.view.transform = CGAffineTransform(translationX: x, y: y)
        }) { (_) in
            self.view.removeFromSuperview()
            self.view.removeSubviews()
            self.view.transform = CGAffineTransform.identity
        }
    }
    
    private func animateOutAppearance(duration: TimeInterval){
        UIView.animate(withDuration: duration,
                       animations: {
                        self.view.alpha = 0
        }) { (_) in
            self.view.removeFromSuperview()
            self.view.removeSubviews()
            self.view.alpha = 1
        }
    }
    
    private func animateOutApperenceWithScale(duration: TimeInterval, x: CGFloat, y:CGFloat) {
        UIView.animate(withDuration: duration,
                       animations: {
                        self.view.alpha = 0
                        self.view.transform = CGAffineTransform.init(scaleX: x, y: y)
        }) { (_) in
            self.view.removeFromSuperview()
            self.view.removeSubviews()
            self.view.transform = CGAffineTransform.identity
            self.view.alpha = 1
        }
    }
    
}
