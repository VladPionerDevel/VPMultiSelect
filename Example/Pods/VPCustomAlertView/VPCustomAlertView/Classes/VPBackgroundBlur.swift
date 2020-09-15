import UIKit

public protocol BlurBackgroundTapDelegat {
    var alertAnimation: VPAlertAnimate! { get set }
    var isHideTapBlurBackground: Bool { get set }
    func hide(animate: VPAlertAnimationType?)
}

public class VPBackgroundBlur: UIVisualEffectView {
    
    private let parentView: UIView
    private var tapGesture: UITapGestureRecognizer! = nil
    public var tapDelegat: BlurBackgroundTapDelegat? = nil
    
    init(effect: UIBlurEffect.Style, parentView: UIView) {
        self.parentView = parentView
        let blurEffect = UIBlurEffect(style: effect)
        super.init(effect: blurEffect)
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapBySelf))
        self.addGestureRecognizer(tapGesture)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func show(animate: Bool) {
        self.alpha = 0
        parentView.addSubview(self)
        setConstraint()

        if animate {
            UIView.animate(withDuration: VPAlertConstants.animateDuration) {
               self.alpha = 1
            }
        } else {
            self.alpha = 1
        }
    }
    
    public func hide(animate: Bool) {
        if animate {
            UIView.animate(withDuration: VPAlertConstants.animateDuration,
                           animations: {
                            self.alpha = 0
            }) { (_) in
                self.removeFromSuperview()
            }
        } else {
            self.alpha = 0
            self.removeFromSuperview()
        }
        
    }
    
    private func setConstraint(){
        self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
    }
    
    @objc private func tapBySelf(){
        guard let tapDelegat = tapDelegat else { return }
        if tapDelegat.isHideTapBlurBackground {
            tapDelegat.hide(animate: tapDelegat.alertAnimation.animationType)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
