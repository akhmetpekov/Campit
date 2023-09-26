//
//  Separator.swift
//  Campit
//
//  Created by Erik on 26.09.2023.
//

import UIKit

class Separator: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Resources.Colors.citate
    }
}
