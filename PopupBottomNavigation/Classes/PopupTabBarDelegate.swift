//
//  PopupTabBarDelegate.swift
//  PopupBottomNavigation
//
//  Created by Aleksey Mikhailov on 30.05.2023.
//

import UIKit

public class PopupTabBarDelegate: NSObject, UITabBarControllerDelegate, UITabBarDelegate {
    private var popupView: UITabBar = {
        let view = UITabBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            view.widthAnchor.constraint(equalToConstant: 160)
        ])
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    private var dismissBackground: TapView = {
        let view = TapView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init() {
        super.init()

        dismissBackground.onTap = { [weak self] in
            DispatchQueue.main.asyncAfter(
                deadline: .now() + 0.01,
                execute: { [weak self] in
                    self?.dismissBackground.removeFromSuperview()
                    self?.popupView.removeFromSuperview()
                }
            )
        }
    }
    
    private weak var activeTabViewController: PopupTabController? = nil
    
    public func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
    ) -> Bool {
        if let nestedVC = viewController as? PopupTabController {
            // show popup menu
            if popupView.superview != nil {
                popupView.removeFromSuperview()
            } else {
                if let view = tabBarController.view {
                    let tabBar = tabBarController.tabBar
                    let popupView = self.popupView
                    
                    popupView.items = nestedVC.nestedViewControllers.map { $0.tabBarItem }
                    popupView.delegate = self
                    
                    self.activeTabViewController = nestedVC
                    
                    let count = tabBarController.viewControllers!.count
                    let pressedIdx = tabBarController.viewControllers!.firstIndex(of: viewController)!
                    // 0 ... 2
                    let offset = (2.0 / CGFloat(count)) / 2.0
                    let multiplier = (CGFloat(pressedIdx) / CGFloat(count)) * 2.0 + offset
                    
                    view.addSubview(dismissBackground)
                    view.addSubview(popupView)
                    view.addConstraints([
                        dismissBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                        dismissBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                        dismissBackground.topAnchor.constraint(equalTo: view.topAnchor),
                        dismissBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                        
                        tabBar.topAnchor.constraint(equalTo: popupView.bottomAnchor, constant: 8),
                        NSLayoutConstraint(
                            item: popupView,
                            attribute: .centerX,
                            relatedBy: .equal,
                            toItem: view,
                            attribute: .centerX,
                            multiplier: multiplier,
                            constant: 0
                        )
                    ])
                }
            }
            
            if nestedVC.selectedNestedViewController == nil {
                return false
            } else {
                return true
            }
        } else {
            return true
        }
    }
    
    public func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let nestedVC = activeTabViewController!
        
        let selectedVCIndex = nestedVC.nestedViewControllers
            .firstIndex { $0.tabBarItem.tag == item.tag }
        nestedVC.selectedNestedViewController = selectedVCIndex
        let selectedVC = nestedVC.nestedViewControllers[selectedVCIndex!]
        nestedVC.tabBarItem = UITabBarItem(
            title: selectedVC.tabBarItem.title,
            image: selectedVC.tabBarItem.image,
            tag: nestedVC.tabBarItem.tag
        )
        
        let tabVC = nestedVC.tabBarController!
        tabVC.selectedViewController = nestedVC
        
        self.activeTabViewController = nil
        self.popupView.removeFromSuperview()
        self.dismissBackground.removeFromSuperview()
    }
}
