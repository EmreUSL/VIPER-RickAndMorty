//
//  UIView+Ext.swift
//  RickAndMorty
//
//  Created by emre usul on 19.02.2023.
//

import UIKit

extension UIView {
    
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
               rotation.toValue = NSNumber(value: Double.pi * 2)
               rotation.duration = 2
               rotation.isCumulative = true
               rotation.repeatCount = 1
               self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
