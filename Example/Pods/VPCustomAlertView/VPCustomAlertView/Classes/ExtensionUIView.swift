//
//  ExtensionUIView.swift
//  VPCustomAlertView
//
//  Created by pioner on 29.05.2020.
//  Copyright © 2020 pioner. All rights reserved.
//

import UIKit

extension UIView {
    
    func removeSubviews () {
        let subviews = self.subviews
        if subviews.count > 0 {
            subviews.forEach { (view) in
                view.removeFromSuperview()
            }
        }
    }
}
