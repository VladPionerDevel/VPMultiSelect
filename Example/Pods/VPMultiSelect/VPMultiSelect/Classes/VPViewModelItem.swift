//
//  ViewModelItem.swift
//  VPMultiSelect
//
//  Created by pioner on 21.08.2020.
//  Copyright © 2020 pioner. All rights reserved.
//

import Foundation

public protocol VPMultiSelectItemProtocol {
    var title: String { get }
}

public class VPViewModelItem {
    
    var item: Any
    
    var isSelected = false
    
    var title: String {
        switch item.self {
            case is VPMultiSelectItemProtocol:
                return (item as! VPMultiSelectItemProtocol).title
            case is String:
                return item as! String
            default:
                return ""
        }
    }
    
    init(item: Any){
        self.item = item
    }
}
