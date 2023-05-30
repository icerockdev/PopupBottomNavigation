//
//  PopupTabBarController.swift
//  PopupBottomNavigation
//
//  Created by Aleksey Mikhailov on 30.05.2023.
//

import UIKit

public class PopupTabBarController: UITabBarController {
    private let popupDelegate = PopupTabBarDelegate()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setup()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.setup()
    }
    
    private func setup() {
        self.delegate = popupDelegate
    }
}
