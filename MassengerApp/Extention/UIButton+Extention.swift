//
//  UIButton+Extention.swift
//  MassengerApp
//
//  Created by J  on 03/06/23.
//

import UIKit
extension UIButton {
    func setButtonProperty(title: String,tinColor: UIColor = .black, image: String = "", imgRightPadding: CGFloat = 0.0, imgLeftPadding: CGFloat = 0.0 ,cornerRadius: CGFloat = 0.0, borderColour: UIColor = .clear, borderWidth: CGFloat = 0.0, backgroundColour: UIColor = .white) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColour.cgColor
        self.layer.borderWidth = borderWidth
        self.backgroundColor = backgroundColour
        self.setTitle(title, for: .normal)
        self.setTitleColor(tinColor, for: .normal)
        self.setImage(UIImage(named: image), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: imgLeftPadding, bottom: 0.0, right: imgRightPadding)
    }
}
