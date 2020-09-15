import UIKit

@available(iOS 11.0, *)
open class VPCustomAlertView: UIView, BlurBackgroundTapDelegat {
    
    public var parentView: UIView
    public var title: String? = nil
    public var message: String? = nil
    public var isShadow = true
    public var isBorder = true
    public var backgroundBlurStyle: UIBlurEffect.Style? = .dark
    public var isHideTapBlurBackground = true
    
    public var buttons: [UIButton]  = []
    public let containerContent = UIView()
    
    public var alertAnimation: VPAlertAnimate!
    public var alertConstraints: VPAlertConsnraints!
    public var backgroundBlurView: VPBackgroundBlur?
    
    public var isAnchorTopToSafeArea: Bool = false
    public var isAnchorBottomToSafeArea: Bool = false
    
    private var actionsButtons: [UIButton: (UIButton) -> Void] = [:]
    private var titleLabel: UILabel? = nil
    private var messageLabel: UILabel? = nil
    
    public init(parentView: UIView) {
        self.parentView = parentView
        super.init(frame: CGRect.zero)
        
        alertAnimation = VPAlertAnimate(view: self, parentView: parentView)
        alertConstraints = VPAlertConsnraints(view: self, parentView: parentView)
        
        self.backgroundColor = .white
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public convenience init(parentView: UIView,width: CGFloat,height:CGFloat){
        self.init(parentView: parentView)
        alertConstraints.positionType = .centerAndSize(width, height)
    }
    
    public convenience init(parentView: UIView,marginAll:CGFloat){
        self.init(parentView: parentView)
        alertConstraints.positionType = .marginAll(marginAll)
    }
    
    public convenience init(parentView: UIView,marginTopBottom:CGFloat,marginLeftRight:CGFloat){
        self.init(parentView: parentView)
        alertConstraints.positionType = .marginTopLeft(marginTopBottom, marginLeftRight)
    }
    
    public convenience init(parentView: UIView,marginTop:CGFloat,marginRight:CGFloat,marginBottom:CGFloat,marginLeft:CGFloat){
        self.init(parentView: parentView)
        alertConstraints.positionType = .margin(marginTop, marginRight, marginBottom, marginLeft)
    }
    
    public func show(animate: VPAlertAnimationType? = nil){
        showBlur(animate)
        
        parentView.addSubview(self)
        
        alertConstraints.setConstraints()
        setSettings()
        setTittle()
        setMessage()
        setActions()
        setContainerContent()
        
        if let animate = animate {
            alertAnimation.animateIn(type: animate)
        }
        
    }
    
    public func hide(animate: VPAlertAnimationType?){
        if let animate = animate {
            alertAnimation.animateOut(type: animate)
        } else {
            self.removeFromSuperview()
            self.removeSubviews()
        }
        
        hideBlur(animate)
    }
    
    public func hide() {
        self.hide(animate: alertAnimation.animationType)
    }
    
    private func setSettings(){
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = VPAlertConstants.shadowOpacity
            self.layer.shadowOffset = CGSize(width: VPAlertConstants.shadowOffsetW, height: VPAlertConstants.shadowOffsetH)
            self.layer.shadowRadius = VPAlertConstants.shadowRadius
        }
        
        if isBorder {
            self.layer.borderWidth = VPAlertConstants.borderWidth
            self.layer.borderColor = VPAlertConstants.borderColor
        }
        
        self.layer.cornerRadius = VPAlertConstants.cornerRadius
    }
    
    // MARK: Continer Content
    
    private func setContainerContent(){
        if message != nil { return }
        
        self.addSubview(containerContent)
        containerContent.translatesAutoresizingMaskIntoConstraints = false
        
        containerContent.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerContent.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        if let titleLabel = self.titleLabel {
            containerContent.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        } else {
            containerContent.topAnchor.constraint(equalTo: topAnchor()).isActive = true
        }
        
        if let topButtons = buttons.last {
            containerContent.bottomAnchor.constraint(equalTo: topButtons.topAnchor).isActive = true
        } else {
            containerContent.bottomAnchor.constraint(equalTo: bottomAnchor()).isActive = true
        }
    }
    
    public func addToContainerContent(viewContent: UIView){
        containerContent.addSubview(viewContent)
        viewContent.translatesAutoresizingMaskIntoConstraints = false
        
        viewContent.topAnchor.constraint(equalTo: containerContent.topAnchor).isActive = true
        viewContent.bottomAnchor.constraint(equalTo: containerContent.bottomAnchor).isActive = true
        viewContent.leadingAnchor.constraint(equalTo: containerContent.leadingAnchor).isActive = true
        viewContent.trailingAnchor.constraint(equalTo: containerContent.trailingAnchor).isActive = true
    }
    
    // MARK: TITLE
    
    public func addTitle(title: String){
        self.title = title
    }
    
    private func setTittle(){
        guard let title = self.title else { return }
        
        titleLabel = UILabel()
        titleLabel!.numberOfLines = 0
        titleLabel!.text = title
        titleLabel!.font = UIFont.systemFont(ofSize: VPAlertConstants.titleFontSize)
        titleLabel!.textAlignment = .center
        self.addSubview(titleLabel!)
        titleLabel!.translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.topAnchor.constraint(equalTo: topAnchor(), constant: VPAlertConstants.titleIndentation).isActive = true
        titleLabel!.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: VPAlertConstants.titleIndentation).isActive = true
        titleLabel!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -VPAlertConstants.titleIndentation).isActive = true
    }
    
    // MARK: message
    
    public func addMessage(message: String) {
        self.message = message
    }
    
    private func setMessage(){
        guard let message = self.message else { return }
               
        messageLabel = UILabel()
        messageLabel!.font = UIFont.systemFont(ofSize: VPAlertConstants.messageFontSize)
        messageLabel!.numberOfLines = 0
        messageLabel!.text = message
        messageLabel!.textAlignment = .center
        self.addSubview(messageLabel!)
        messageLabel!.translatesAutoresizingMaskIntoConstraints = false
        
        if title == nil {
            messageLabel!.topAnchor.constraint(equalTo: self.topAnchor, constant: VPAlertConstants.messageIndentation).isActive = true
        } else {
            if let titleLabel = titleLabel {
                messageLabel!.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: VPAlertConstants.messageIndentation).isActive = true
            }
        }
        messageLabel!.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: VPAlertConstants.messageIndentation).isActive = true
        messageLabel!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -VPAlertConstants.messageIndentation).isActive = true
    }
    
    // MARK: ACTIONS
    
    public func addAction(title: String,titleColor: UIColor = .systemBlue ,handler: @escaping (UIButton) -> Void ) {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        actionsButtons[button] = handler
        buttons.append(button)
        button.addTarget(self, action: #selector(handlerButton), for: .touchUpInside)
    }
    
    @objc private func handlerButton(sender: UIButton) {
        if let action = actionsButtons[sender] {
            action(sender)
        }
    }

    private func setActions() {
        guard buttons.count > 0 else { return }
        
        var topButton: UIButton? = nil

        buttons.forEach { (button) in
            self.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

            if let prevButton = topButton {
                button.bottomAnchor.constraint(equalTo: prevButton.topAnchor).isActive = true
            } else {
                button.bottomAnchor.constraint(equalTo: bottomAnchor()).isActive = true
            }
            topButton = button
        }
    }
    
    //MARK: background blur
    
    private func setBlurView(){
        if backgroundBlurView != nil { return }
        
        if let backgroundBlur = backgroundBlurStyle {
            backgroundBlurView =  VPBackgroundBlur(effect: backgroundBlur, parentView: parentView)
            backgroundBlurView!.tapDelegat = self
        }
    }
    
    private func showBlur(_ animate: VPAlertAnimationType?) {
        setBlurView()
        if let blurView = backgroundBlurView {
            let blurAnimate = animate != nil ? true : false
            blurView.show(animate: blurAnimate)
        }
    }
    
    private func hideBlur(_ animate: VPAlertAnimationType?) {
        if let blurView = backgroundBlurView {
            let blurAnimate = animate != nil ? true : false
            blurView.hide(animate: blurAnimate)
        }
    }
    
    //MARK: other
    
    private func topAnchor() -> NSLayoutYAxisAnchor {
        return !isAnchorTopToSafeArea ? self.topAnchor : self.parentView.safeAreaLayoutGuide.topAnchor
    }
    
    private func bottomAnchor() -> NSLayoutYAxisAnchor {
        return !isAnchorBottomToSafeArea ? self.bottomAnchor : self.parentView.safeAreaLayoutGuide.bottomAnchor
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

