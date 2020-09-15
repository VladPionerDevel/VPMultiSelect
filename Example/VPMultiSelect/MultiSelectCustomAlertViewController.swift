//
//  MultiSelectCustomAlertViewController.swift
//  VPMultiSelect_Example
//
//  Created by pioner on 07.09.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
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

        serupCustomAlerView()
        multiSelect = VPMultiSelect(parentView: customAlertView.containerContent, arrayItems: items)
        
    }
    
    func serupCustomAlerView(){
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
