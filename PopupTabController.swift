//
//  PopupTabController.swift
//  popup-bottom-navigation
//
//  Created by Aleksey Mikhailov on 30.05.2023.
//

import UIKit

open class PopupTabController: UIViewController {
    public var nestedViewControllers: [UIViewController] = [] {
        didSet {
            self.selectedNestedViewController = nil
        }
    }
    public var selectedNestedViewController: Int? = nil {
        didSet {
            let oldVC: UIViewController?
            let newVC: UIViewController?
            if let oldValue {
                oldVC = nestedViewControllers[oldValue]
            } else {
                oldVC = nil
            }
            
            if let newValue = selectedNestedViewController {
                newVC = nestedViewControllers[newValue]
            } else {
                newVC = nil
            }
            
            if let vc = oldVC {
                vc.willMove(toParentViewController: nil)
                vc.view.removeFromSuperview()
                vc.removeFromParentViewController()
                vc.didMove(toParentViewController: nil)
            }
            
            if let vc = newVC {
                vc.willMove(toParentViewController: self)
                self.addChildViewController(vc)
                self.view.addSubview(vc.view)
                vc.didMove(toParentViewController: self)
            }
        }
    }
}
