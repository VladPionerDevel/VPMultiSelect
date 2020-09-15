//
//  ViewModel.swift
//  VPMultiSelect
//
//  Created by pioner on 21.08.2020.
//  Copyright © 2020 pioner. All rights reserved.
//

import UIKit

class VPViewModel: NSObject {
    
    var items = [VPViewModelItem]()
    
    init(arrayItems: [Any]) {
        items = arrayItems.map { VPViewModelItem(item: $0) }
    }
}

extension VPViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VPMultiSelectCell.self), for: indexPath) as? VPMultiSelectCell else {
            return UITableViewCell()
        }
        
        cell.item = items[indexPath.row]
        
        return cell
        
    }
    
}
