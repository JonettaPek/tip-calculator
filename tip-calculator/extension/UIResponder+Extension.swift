//
//  UIResponder+Extension.swift
//  tip-calculator
//
//  Created by Jonetta Pek on 7/12/23.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
