import UIKit

public enum VPAlertPositionType {
    case center
    case centerAndSize(CGFloat,CGFloat)
    case marginAll(CGFloat)
    case marginTopLeft(CGFloat,CGFloat)
    case margin(CGFloat,CGFloat,CGFloat,CGFloat)
}

public class VPAlertConsnraints {
    
    let view: UIView
    let parentView: UIView
    public var positionType: VPAlertPositionType
    
    let widthDefault: CGFloat = VPAlertConstants.widthDefault
    let heightDefault: CGFloat = VPAlertConstants.heightDefault
    
    init(view: UIView, parentView: UIView) {
        self.view = view
        self.parentView = parentView
        positionType = .center
    }
    
    public func setConstraints(){
        switch positionType {
            case .center:
                setConstraintsCenter(width: widthDefault, height: heightDefault)
            case let .centerAndSize(width, height):
                setConstraintsCenter(width: width, height: height)
            case let .marginAll(marginAll):
                setConstraintsWithMargin(all: marginAll)
            case let .marginTopLeft(topBottom, leftRight):
                setConstraintsWithMargin(topBottom: topBottom, leftRight: leftRight)
            case let .margin(top, right, bottom, left):
                    setConstraintsWithMargin(top: top, right: right, bottom: bottom, left: left)
        }
    }
    
    private func setConstraintsCenter(width: CGFloat,height: CGFloat) {
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        view.widthAnchor.constraint(equalToConstant: width).isActive = true
        view.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
    }
    
    private func setConstraintsWithMargin(top: CGFloat,right: CGFloat,bottom: CGFloat,left:CGFloat) {
        view.topAnchor.constraint(equalTo: parentView.topAnchor, constant: top).isActive = true
        view.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -bottom).isActive = true
        view.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: left).isActive = true
        view.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -right).isActive = true
    }
    
    private func setConstraintsWithMargin(topBottom: CGFloat,leftRight: CGFloat) {
        setConstraintsWithMargin(top: topBottom, right: leftRight, bottom: topBottom, left: leftRight)
    }
    
    private func setConstraintsWithMargin(all: CGFloat) {
        setConstraintsWithMargin(top: all, right: all, bottom: all, left: all)
    }
}
