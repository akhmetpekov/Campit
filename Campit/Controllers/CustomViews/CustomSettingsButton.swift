//
//  CustomSettingsButton.swift
//  Campit
//
//  Created by Erik on 24.09.2023.
//

import UIKit
import SnapKit

class CustomSettingsButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = Resources.Colors.buttonIsHighlighted
            } else {
                backgroundColor = .clear
            }
        }
    }
    
    private let label1 = UILabel()
    private let label2 = UILabel()
    private var isTurnOn: Bool = false
    private let mySwitch = UISwitch()
    
    init(title1: String, title2: Any? = nil) {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        label1.text = title1
        label1.font = UIFont(name: Resources.Fonts.tab, size: 23)
        label1.textColor = Resources.Colors.active
        
        if let title2Text = title2 as? String {
            label2.text = title2Text
            label2.font = UIFont(name: Resources.Fonts.tab, size: 23)
            label2.textColor = Resources.Colors.buttonSecondaryTitle
            addSubview(label2)
            
            label2.snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(Resources.Constants.trailing)
                make.top.equalToSuperview()
                make.bottom.equalToSuperview()
                make.height.equalToSuperview()
            }
        }
        
        if let _ = title2 as? UISwitch {
            addSubview(mySwitch)
            
            mySwitch.snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(Resources.Constants.trailing)
                make.centerY.equalToSuperview()
            }
        }
        
        addSubview(label1)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        label1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.leading)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    func changeSwitch() {
        isTurnOn = !isTurnOn
        
        mySwitch.isOn = isTurnOn
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
