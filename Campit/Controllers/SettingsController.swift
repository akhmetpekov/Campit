//
//  SettingsViewController.swift
//  Campit
//
//  Created by Erik on 19.09.2023.
//

import UIKit
import SnapKit

final class SettingsController: UIViewController {
    
    private lazy var topLabel: UIButton = {
        let button = UIButton()
        let customFont = UIFont(name: Resources.Fonts.main, size: 40)
        let customColor = Resources.Colors.active
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: customFont as Any,
            .foregroundColor: customColor as Any
        ]
        let attributedTitle = NSAttributedString(string: "settings", attributes: titleAttributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.configuration = .plain()
        button.configuration?.baseForegroundColor = customColor
        button.isEnabled = false
        return button
    }()
    
    private let blockView: UIView = {
        let block = UIView()
        block.backgroundColor = .clear
        block.layer.borderColor = Resources.Colors.citate.cgColor
        block.layer.borderWidth = 1
        block.layer.masksToBounds = true
        return block
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        blockView.layer.cornerRadius = blockView.frame.width / 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = Resources.Colors.primary
        view.addSubview(topLabel)
        view.addSubview(blockView)
    }
    
    private func makeConstraints() {
        topLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.titleLeading)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Resources.Constants.titleTop)
        }
        
        blockView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.titleLeading)
            make.trailing.equalToSuperview().offset(-1 * Resources.Constants.titleLeading)
            make.top.equalTo(topLabel.snp.bottom).offset(15)
            make.height.equalTo(200)
        }
    }
    
}
