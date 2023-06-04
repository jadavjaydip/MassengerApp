//
//  UIView+Extention.swift
//  MassengerApp
//
//  Created by J  on 03/06/23.
//

import UIKit

extension UIView {
    func addBorderWithTitleSetup(cornerRadius: CGFloat, borderWidth: CGFloat, borderColour: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColour.cgColor
    }
}
