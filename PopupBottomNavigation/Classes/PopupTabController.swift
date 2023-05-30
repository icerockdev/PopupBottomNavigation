//
//  PopupTabController.swift
//  PopupBottomNavigation
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
                oldVC = self.nestedViewControllers[oldValue]
            } else {
                oldVC = nil
            }
            
            if let newValue = self.selectedNestedViewController {
                newVC = self.nestedViewControllers[newValue]
            } else {
                newVC = nil
            }
            
            if let vc = oldVC {
                vc.willMove(toParent: nil)
                vc.view.removeFromSuperview()
                vc.removeFromParent()
                vc.didMove(toParent: nil)
            }
            
            if let vc = newVC {
                vc.willMove(toParent: self)
                self.addChild(vc)
                self.view.addSubview(vc.view)
                vc.didMove(toParent: self)
            }
            
            self.didChangeSelectedNestedViewController()
        }
    }
    
    open func didChangeSelectedNestedViewController() {
        guard let idx = self.selectedNestedViewController else { return }
        
        let selectedVC = self.nestedViewControllers[idx]
        
        self.tabBarItem = UITabBarItem(
            title: selectedVC.tabBarItem.title,
            image: selectedVC.tabBarItem.image,
            tag: self.tabBarItem.tag
        )
    }
}
