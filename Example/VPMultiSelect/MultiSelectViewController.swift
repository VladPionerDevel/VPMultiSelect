//
//  ViewController.swift
//  VPMultiSelect
//
//  Created by pionerdevel@gmail.com on 08/31/2020.
//  Copyright (c) 2020 pionerdevel@gmail.com. All rights reserved.
//

import UIKit
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

