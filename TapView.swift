//
//  TapView.swift
//  popup-bottom-navigation
//
//  Created by Aleksey Mikhailov on 30.05.2023.
//

import UIKit

class TapView: UIView {
    var onTap: () -> Void = {}
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        onTap()
        return nil
    }
}
