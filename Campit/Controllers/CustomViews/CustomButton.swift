//
//  CustomButton.swift
//  Campit
//
//  Created by Erik on 21.09.2023.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private var defaultString: String = ""
    
    init(title: String, icon: String? = nil, font: UIFont? = UIFont(name: Resources.Fonts.tab, size: 22)) {
        super.init(frame: .zero)
        if let image = icon {
            let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .default)
            configuration = .plain()
            configuration?.image = UIImage(systemName: image, withConfiguration: config)
            configuration?.baseForegroundColor = Resources.Colors.greenTint
            configuration?.imagePlacement = .leading
            configuration?.imagePadding = 10
        }
        defaultString = title
        backgroundColor = .clear
        let customFont = font
        let customColor = Resources.Colors.inactive
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: customFont as Any,
            .foregroundColor: customColor as Any
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: titleAttributes)
        setAttributedTitle(attributedTitle, for: .normal)
        layer.borderWidth = 1
        layer.borderColor = Resources.Colors.citate.cgColor
    }
    
    func changeTitleColor(color: UIColor, font: UIFont? = UIFont(name: Resources.Fonts.tab, size: 22)) {
        let customFont = font
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: customFont as Any,
            .foregroundColor: color as Any
        ]
        let attributedTitle = NSAttributedString(string: defaultString, attributes: titleAttributes)
        setAttributedTitle(attributedTitle, for: .normal)
    }
    
    func changeBorderColor(color: UIColor) {
        layer.borderColor = color.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

