# VPMultiSelect

[![Version](https://img.shields.io/cocoapods/v/VPMultiSelect.svg?style=flat)](https://cocoapods.org/pods/VPMultiSelect)
[![License](https://img.shields.io/cocoapods/l/VPMultiSelect.svg?style=flat)](https://cocoapods.org/pods/VPMultiSelect)
[![Platform](https://img.shields.io/cocoapods/p/VPMultiSelect.svg?style=flat)](https://cocoapods.org/pods/VPMultiSelect)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

VPMultiSelect is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'VPMultiSelect'
```

## Author

vladpionerdevel@gmail.com

## License

VPMultiSelect is available under the MIT license. See the LICENSE file for more info.

## Examples 1

![alt tag](https://raw.githubusercontent.com/VladPionerDevel/VPMultiSelect/master/VPMultiSelect/Assets/Screenshots/multiSelect.gif "simple")​

Code:
```Swift
import VPMultiSelect

class MultiSelectViewController: UIViewController {
    
    @IBOutlet weak var viewForMultiSelect: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var showActionTextView: UITextView!
    
    var multiSelect: VPMultiSelect<User>!
    var items: [User] = [
        User(lastName: "Ivanov", firstName: "Ivan", age: 18),
        User(lastName: "Petrov", firstName: "Petr", age: 34),
        User(lastName: "Sidorv", firstName: "Sidr", age: 21),
        User(lastName: "Pupkin", firstName: "Vasia", age: 25),
        User(lastName: "Spider", firstName: "Man", age: 16),
        User(lastName: "Super", firstName: "Man", age: 20),
        User(lastName: "Bat", firstName: "Man", age: 30),
        User(lastName: "Doe", firstName: "John", age: 30),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        multiSelect = VPMultiSelect(parentView: viewForMultiSelect, arrayItems: items)
        
        multiSelect.delegat = self
        
    }
    
    @IBAction func deselectedAllTapped(_ sender: UIButton) {
        multiSelect.deselectedAll()
    }
    
    @IBAction func selectedAllTapped(_ sender: UIButton) {
        multiSelect.selectedAll()
    }
    
    @IBAction func getSelectedAllTapped(_ sender: UIButton) {
        var selectedItemsString = ""
        multiSelect.selectedItems.forEach { (item) in
            selectedItemsString += item.title + "\r\n"
        }
        textView.text = selectedItemsString
    }

}

extension User: VPMultiSelectItemProtocol {
    var title: String {
        return "\(lastName) \(firstName)"
    }
}

extension MultiSelectViewController: VPMultiSelectDelegat {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showActionTextView.text = "Select: \(items[indexPath.row].title)"
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        showActionTextView.text = "Deselect: \(items[indexPath.row].title)"
    }
    
}
```

Create object VPMultiSelect
```Swift
multiSelect = VPMultiSelect(parentView: viewForMultiSelect, arrayItems: items)
```
parentView - this is parent UIView in which the multi select will be placed

arrayItems - it is an array of Strings or class objects that implements the protocol VPMultiSelectItemProtocol

## Examples 2
## VPMultiSelect + VPCustomAlertViev

![alt tag](https://raw.githubusercontent.com/VladPionerDevel/VPMultiSelect/master/VPMultiSelect/Assets/Screenshots/multiSelect_customAlertView.gif "simple")​

### Podfile

```Podfile
platform :ios, '11.0'

target 'VPMultiSelect_Example' do
    use_frameworks!
    pod 'VPMultiSelect'
    pod 'VPCustomAlertView'

end
```

Code:
```Swift
import VPMultiSelect
import VPCustomAlertView

class MultiSelectCustomAlertViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var customAlertView: VPCustomAlertView!
    
    var multiSelect: VPMultiSelect<User>!
    var items: [User] = [
        User(lastName: "Ivanov", firstName: "Ivan", age: 18),
        User(lastName: "Petrov", firstName: "Petr", age: 34),
        User(lastName: "Sidorv", firstName: "Sidr", age: 21),
        User(lastName: "Pupkin", firstName: "Vasia", age: 25),
        User(lastName: "Spider", firstName: "Man", age: 16),
        User(lastName: "Super", firstName: "Man", age: 20),
        User(lastName: "Bat", firstName: "Man", age: 30),
        User(lastName: "Doe", firstName: "John", age: 30),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // create VPCustomAlertViev
        setupCustomAlerView()
        // create an VPMultiSelect and add it to the VPCustomAlertViev
        multiSelect = VPMultiSelect(parentView: customAlertView.containerContent, arrayItems: items)
        
    }
    
    func setupCustomAlerView(){
        customAlertView = VPCustomAlertView(parentView: self.view, marginTop: 80, marginRight: 30, marginBottom: 100, marginLeft: 30)
        
        customAlertView.isHideTapBlurBackground = true
        
        customAlertView.addTitle(title: "MultiSelect on CustomAlertView")
        
        
        customAlertView.addAction(title: "Ok") { (button) in
            var selectedItemsString = ""
            self.multiSelect.selectedItems.forEach { (item) in
                selectedItemsString += item.title + "\r\n"
            }
            self.textView.text = selectedItemsString
            
            self.customAlertView.hide()
        }
        
    }
    
    @IBAction func showTapped(_ sender: UIButton) {
        customAlertView.show(animate: .popapFromTop)
    }
    
}

```



