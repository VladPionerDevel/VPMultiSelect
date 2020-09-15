//
//  MultiSelect.swift
//  VPMultiSelect
//
//  Created by pioner on 20.08.2020.
//  Copyright © 2020 pioner. All rights reserved.
//

import UIKit

public protocol VPMultiSelectDelegat {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
     
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    
}

@available(iOS 9.0, *)
open class VPMultiSelect<Element>: UIView, UITableViewDelegate {
    
    public var parentView: UIView!
    public var tableView: UITableView!
    private var viewModel: VPViewModel!
    
    public var selectedItems: [Element] {
        var items = [Element]()
        viewModel.items.forEach { (item) in
            if item.isSelected {
                if let item = item.item as? Element {
                    items.append(item)
                }
            }
        }
        return items
    }
    
    public var delegat: VPMultiSelectDelegat?
    

    public init(parentView: UIView,arrayItems: [Element]) {
        self.parentView = parentView
        super.init(frame: CGRect.zero)
        
        parentView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        
        if arrayItems.first.self is VPMultiSelectItemProtocol || arrayItems.first.self is String {
            viewModel = VPViewModel(arrayItems: arrayItems)
        } else {
            fatalError("VPMultiSelect array item type must be String or VPMultiSelectItemProtocol")
        }
        
        setupTableView()
    }
    
    public func deselectedAll(){
        for i in 0..<viewModel.items.count{
            deselectItem(number: i)
        }
    }
    
    public func selectedAll(){
        for i in 0..<viewModel.items.count{
            selectItem(number: i)
        }
    }
    
    public func selectItem(number: Int){
        guard number < viewModel.items.count else { return }
        tableView.selectRow(at: IndexPath(row: number, section: 0), animated: false, scrollPosition: .none)
        viewModel.items[number].isSelected = true
    }
    
    public func deselectItem(number: Int){
        guard number < viewModel.items.count else { return }
        tableView.deselectRow(at: IndexPath(row: number, section: 0), animated: false)
        viewModel.items[number].isSelected = false
    }
    
    private func setupTableView(){
        tableView = UITableView()
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.register(VPMultiSelectCell.self, forCellReuseIdentifier: String(describing: VPMultiSelectCell.self))
        tableView.allowsMultipleSelection = true
        tableView.dataSource = viewModel
        tableView.delegate = self
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // UITableViewDelegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.items[indexPath.row].isSelected = true

        delegat?.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.items[indexPath.row].isSelected = false

        delegat?.tableView(tableView, didDeselectRowAt: indexPath)
     }
    
}


