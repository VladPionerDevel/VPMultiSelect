//
//  MultiSelectCustomAlert2ViewController.swift
//  VPMultiSelect_Example
//
//  Created by pioner on 10.09.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import VPMultiSelect
import VPCustomAlertView

class MultiSelectCustomAlert2ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var customAlertView: VPCustomAlertView!
    
    var multiSelect: VPMultiSelect<String>!
    var items = ["Ivanov Ivan","Petrov Petr","Sidorv Sidr","Pupkin Vasia","Spider Man","Super Man","Bat Man","Doe John"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCustomAlertView()
        
        multiSelect = VPMultiSelect(parentView: customAlertView.containerContent, arrayItems: items)
        
    }
    
    func setupCustomAlertView(){
        customAlertView = VPCustomAlertView(parentView: self.view, marginTop: 0, marginRight: 0, marginBottom: 0, marginLeft: 50)
        customAlertView.isAnchorTopToSafeArea = true
        customAlertView.isAnchorBottomToSafeArea = true
        
        customAlertView.addTitle(title: "MultiSelect on CustomAlertView")
        
        customAlertView.addAction(title: "Ok") { (button) in
            var selectedItemsString = ""
            self.multiSelect.selectedItems.forEach { (item) in
                selectedItemsString += item + "\r\n"
            }
            self.textView.text = selectedItemsString
            self.customAlertView.hide()
        }
    }
    
    @IBAction func showTapped(_ sender: UIButton) {
        customAlertView.show(animate: .popapFromRight)
    }
    

}
