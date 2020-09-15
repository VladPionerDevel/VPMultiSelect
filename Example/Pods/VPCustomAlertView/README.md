# VPCustomAlertView

[![Version](https://img.shields.io/cocoapods/v/VPCustomAlertView.svg?style=flat)](https://cocoapods.org/pods/VPCustomAlertView)
[![Platform](https://img.shields.io/cocoapods/p/VPCustomAlertView.svg?style=flat)](https://cocoapods.org/pods/VPCustomAlertView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* iOS11

## Installation

VPCustomAlertView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'VPCustomAlertView'
```

## Usage

```Swift
import VPCustomAlertView

var customAlertView: VPCustomAlertView!
    
override func viewDidLoad() {
    super.viewDidLoad()

    customAlertView = VPCustomAlertView(parentView: view)
    customAlertView.addTitle(title: "Title")
    customAlertView.addMessage(message: "Message")
}

@IBAction func ShowTaped(_ sender: UIButton) {
    customAlertView.show()
}

@IBAction func HideTspped(_ sender: Any) {
    customAlertView.hide()
}

```

## Author

VladPioner

## License

VPCustomAlertView is available under the MIT license. See the LICENSE file for more info.

## Examples 1

![alt tag](https://raw.githubusercontent.com/VladPionerDevel/VPCustomAlertView/master/VPCustomAlertView/Assets/Screenshots/simple.gif "simple")​

Code:
```Swift
import VPCustomAlertView

@available(iOS 11.0, *)
class SimpleAlertViewController: UIViewController {

    var customAlertView: VPCustomAlertView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customAlertView = VPCustomAlertView(parentView: view)
        customAlertView.addTitle(title: "Simple Alert View")
        customAlertView.addMessage(message: "My Super Message for Custom Alert View")
        customAlertView.backgroundBlurStyle = .none
    }
    
    @IBAction func ShowTaped(_ sender: UIButton) {
        customAlertView.show()
    }
    
    @IBAction func HideTspped(_ sender: Any) {
        customAlertView.hide()
    }
    
}
```

## Examples 2

![alt tag](https://raw.githubusercontent.com/VladPionerDevel/VPCustomAlertView/master/VPCustomAlertView/Assets/Screenshots/simpleActionAnimate.gif "simple")​
Code:
```Swift
import VPCustomAlertView

@available(iOS 11.0, *)
class AlertActionAnimateViewController: UIViewController {

    var customAlertView: VPCustomAlertView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customAlertView = VPCustomAlertView(parentView: view)
        customAlertView.addTitle(title: "Alert + Action + Animate View")
        customAlertView.addMessage(message: "My Super Message for Custom Alert View")
        
        customAlertView.addAction(title: "First Button") { (button) in
            print("Tapped \"\(button.titleLabel?.text ?? "")\" and hide alert")
            self.customAlertView.hide()
        }
        customAlertView.addAction(title: "Second Button", titleColor: .red) { (button) in
            print("Tapped \"\(button.titleLabel?.text ?? "")\"")
        }
    }
    
    @IBAction func showTapped(_ sender: UIButton) {
        customAlertView.show(animate: .popapFromBottom)
    }
    
}
```

## Examples 3

![alt tag](https://raw.githubusercontent.com/VladPionerDevel/VPCustomAlertView/master/VPCustomAlertView/Assets/Screenshots/fromRightList.gif "simple")​
Code:
```Swift
import VPCustomAlertView

@available(iOS 11.0, *)
class AlertFromRightViewController: UIViewController {

    var customAlertView: VPCustomAlertView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customAlertView = VPCustomAlertView(parentView: self.view, marginTop: 0, marginRight: 0, marginBottom: 0, marginLeft: 50)
        customAlertView.isAnchorTopToSafeArea = true
        customAlertView.isAnchorBottomToSafeArea = true
        customAlertView.isHideTapBlurBackground = false
        
        customAlertView.addTitle(title: "Alert from right list")
        let tableView = UITableView()
        customAlertView.addToContainerContent(viewContent: tableView)
        
        customAlertView.addAction(title: "Ok") { (button) in
            print("Tapped \"\(button.titleLabel?.text ?? "")\" and hide alert")
            self.customAlertView.hide()
        }
        customAlertView.addAction(title: "Cancel", titleColor: .red) { (button) in
            print("Tapped \"\(button.titleLabel?.text ?? "")\" and hide alert")
            self.customAlertView.hide()
        }
    }
    
    @IBAction func showTapped(_ sender: Any) {
        customAlertView.show(animate: .popapFromRight)
        customAlertView.layer.cornerRadius = 0
    }
    
}
```

## Examples 4

![alt tag](https://raw.githubusercontent.com/VladPionerDevel/VPCustomAlertView/master/VPCustomAlertView/Assets/Screenshots/fromTop.gif "simple")​
Code:
```Swift
import VPCustomAlertView

@available(iOS 11.0, *)
class AlertFromTopViewController: UIViewController {

    var customAlertView: VPCustomAlertView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customAlertView = VPCustomAlertView(parentView: self.view, marginTop: 0, marginRight: 0, marginBottom: 200, marginLeft: 0)
        customAlertView.isAnchorTopToSafeArea = true
        customAlertView.isHideTapBlurBackground = false
        
        customAlertView.addTitle(title: "From Top Alert View")
        let viewContentAlert = UIView()
        viewContentAlert.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        customAlertView.addToContainerContent(viewContent: viewContentAlert)
        
        customAlertView.addAction(title: "Ok") { (button) in
            print("Tapped \"\(button.titleLabel?.text ?? "")\" and hide alert")
            self.customAlertView.hide()
        }
        customAlertView.addAction(title: "Cancel", titleColor: .red) { (button) in
            print("Tapped \"\(button.titleLabel?.text ?? "")\" and hide alert")
            self.customAlertView.hide()
        }
    }
    
    @IBAction func showTapped(_ sender: UIButton) {
        customAlertView.show(animate: .popapFromTop)
    }
    
}
```


## Examples 5

![alt tag](https://raw.githubusercontent.com/VladPionerDevel/VPCustomAlertView/master/VPCustomAlertView/Assets/Screenshots/fromTopToBottom1.gif "simple")​
Code:
```Swift
import VPCustomAlertView

@available(iOS 11.0, *)
class FromLeftToRightViewController: UIViewController {

    var customAlertView: VPCustomAlertView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customAlertView = VPCustomAlertView(parentView: view)
        customAlertView.addTitle(title: "From left To right")
        customAlertView.addMessage(message: "My Super Message for Custom Alert View")
        customAlertView.backgroundBlurStyle = .light
        
        customAlertView.addAction(title: "To Right") { (button) in
            print("Tapped \"\(button.titleLabel?.text ?? "")\"")
            self.customAlertView.hide(animate: .popapFromRight)
        }
        customAlertView.addAction(title: "To Bottom") { (button) in
            print("Tapped \"\(button.titleLabel?.text ?? "")\"")
            self.customAlertView.hide(animate: .popapFromBottom)
        }
    }
    
    @IBAction func fromLeftTapped(_ sender: UIButton) {
        customAlertView.show(animate: .popapFromLeft)
    }
    
    @IBAction func fromTopTapped(_ sender: UIButton) {
        customAlertView.show(animate: .popapFromTop)
    }
    
}
```

## Settings
```Swift
customAlertView.parentView = self.view // родительский контейнер UIView задается при создании объекта VPCustomAlertView первым параметром
customAlertView.title = "Title"
customAlertView.message = "Message"
customAlertView.isShadow = true // будет ли у alert тень
customAlertView.isBorder = true // будет ли у alert border
customAlertView.backgroundBlurStyle = .dark // тип UIBlurEffect.Style? стиль заднего размытого фона
customAlertView.isHideTapBlurBackground = true // будет ли пропадать alert при клике по заднему размытому фону
customAlertView.isAnchorTopToSafeArea = true // требуется если alert до самого верха экрана чтобы элементы alert не перекрывались элементами интерфейса телефона
customAlertView.isAnchorBottomToSafeArea = true // требуется если alert до самого низа экрана чтобы элементы alert не перекрывались элементами интерфейса телефона

customAlertView.buttons // массив кнопок alert, если были добавлены actions (кнопки)
```

