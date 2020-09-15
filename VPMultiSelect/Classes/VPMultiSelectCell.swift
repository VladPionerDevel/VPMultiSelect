//
//  CustomCell.swift
//  VPMultiSelect
//
//  Created by pioner on 20.08.2020.
//  Copyright © 2020 pioner. All rights reserved.
//

import UIKit

open class VPMultiSelectCell: UITableViewCell {
    
    public var item: VPViewModelItem? {
        didSet {
            textLabel?.text = item?.title
        }
    }
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }
    
    
}
