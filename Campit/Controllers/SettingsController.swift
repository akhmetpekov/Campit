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
    
    private let secondBlockView: UIView = {
        let block = UIView()
        block.backgroundColor = .clear
        block.layer.borderColor = Resources.Colors.citate.cgColor
        block.layer.borderWidth = 1
        block.layer.masksToBounds = true
        return block
    }()
    
    private lazy var languageButton: CustomSettingsButton = {
        let button = CustomSettingsButton(title1: "Language", title2: "English")
        button.addTarget(self, action: #selector(languageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var notificationsButton: CustomSettingsButton = {
        let button = CustomSettingsButton(title1: "Notifications", title2: "Enabled")
        button.addTarget(self, action: #selector(notificationsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var showDatedButton: CustomSettingsButton = {
        let mySwitch = UISwitch()
        let button = CustomSettingsButton(title1: "Show Dates", title2: mySwitch)
        button.addTarget(self, action: #selector(showDateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var contactUsButton: CustomSettingsButton = {
        let button = CustomSettingsButton(title1: "Contact Us")
        return button
    }()
    
    private lazy var termsOfUseButton: CustomSettingsButton = {
        let button = CustomSettingsButton(title1: "Terms of Use")
        return button
    }()
    
    private lazy var privacyPolicyButton: CustomSettingsButton = {
        let button = CustomSettingsButton(title1: "Privacy Policy")
        return button
    }()
    
    private lazy var aboutUsButton: CustomSettingsButton = {
        let button = CustomSettingsButton(title1: "About Us")
        return button
    }()
    
    private lazy var shareButton: CustomSettingsButton = {
        let button = CustomSettingsButton(title1: "Share")
        return button
    }()
    
    private let separator = Separator()
    private let separator2 = Separator()
    private let separator3 = Separator()
    private let separator4 = Separator()
    private let separator5 = Separator()
    private let separator6 = Separator()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        blockView.layer.cornerRadius = blockView.frame.width / 20
        secondBlockView.layer.cornerRadius = blockView.frame.width / 20
        let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        languageButton.layer.cornerRadius = languageButton.frame.width / 20
        languageButton.layer.maskedCorners = maskedCorners
        
        let maskedCorners2: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        showDatedButton.layer.cornerRadius = showDatedButton.frame.width / 20
        showDatedButton.layer.maskedCorners = maskedCorners2
        
        contactUsButton.layer.cornerRadius = contactUsButton.frame.width / 20
        contactUsButton.layer.maskedCorners = maskedCorners
        
        shareButton.layer.cornerRadius = shareButton.frame.width / 20
        shareButton.layer.maskedCorners = maskedCorners2
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
        view.addSubview(languageButton)
        view.addSubview(separator)
        view.addSubview(notificationsButton)
        view.addSubview(separator2)
        view.addSubview(showDatedButton)
        view.addSubview(secondBlockView)
        view.addSubview(contactUsButton)
        view.addSubview(separator3)
        view.addSubview(termsOfUseButton)
        view.addSubview(separator4)
        view.addSubview(privacyPolicyButton)
        view.addSubview(separator5)
        view.addSubview(aboutUsButton)
        view.addSubview(separator6)
        view.addSubview(shareButton)
    }
    
    private func makeConstraints() {
        topLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.titleLeading)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Resources.Constants.titleTop)
        }
        
        blockView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.titleLeading + 12)
            make.trailing.equalToSuperview().offset(-1 * Resources.Constants.titleLeading - 12)
            make.top.equalTo(topLabel.snp.bottom).offset(15)
            make.height.equalTo(200)
        }
        
        secondBlockView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.titleLeading + 12)
            make.trailing.equalToSuperview().offset(-1 * Resources.Constants.titleLeading - 12)
            make.top.equalTo(blockView.snp.bottom).offset(15)
            make.height.equalTo(336)
        }
        
        languageButton.snp.makeConstraints { make in
            make.top.equalTo(blockView.snp.top).offset(1)
            make.leading.equalTo(blockView).offset(1)
            make.trailing.equalTo(blockView).offset(-1)
            make.height.equalTo(200 / 3)
        }
        
        separator.snp.makeConstraints { make in
            make.top.equalTo(languageButton.snp.bottom)
            make.leading.equalTo(blockView)
            make.trailing.equalTo(blockView)
            make.height.equalTo(1)
        }
        
        notificationsButton.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom)
            make.leading.equalTo(blockView).offset(1)
            make.trailing.equalTo(blockView).offset(-1)
            make.height.equalTo(200 / 3)
        }
        
        separator2.snp.makeConstraints { make in
            make.top.equalTo(notificationsButton.snp.bottom)
            make.leading.equalTo(blockView)
            make.trailing.equalTo(blockView)
            make.height.equalTo(1)
        }
        
        showDatedButton.snp.makeConstraints { make in
            make.top.equalTo(separator2.snp.bottom)
            make.leading.equalTo(blockView).offset(1)
            make.trailing.equalTo(blockView).offset(-1)
            make.height.equalTo(200 / 3 - 2)
        }
        
        contactUsButton.snp.makeConstraints { make in
            make.top.equalTo(secondBlockView.snp.top).offset(1)
            make.leading.equalTo(secondBlockView).offset(1)
            make.trailing.equalTo(secondBlockView).offset(-1)
            make.height.equalTo(333 / 5)
        }
        
        separator3.snp.makeConstraints { make in
            make.top.equalTo(contactUsButton.snp.bottom)
            make.leading.equalTo(secondBlockView)
            make.trailing.equalTo(secondBlockView)
            make.height.equalTo(1)
        }
        
        termsOfUseButton.snp.makeConstraints { make in
            make.top.equalTo(separator3.snp.bottom)
            make.leading.equalTo(secondBlockView).offset(1)
            make.trailing.equalTo(secondBlockView).offset(-1)
            make.height.equalTo(333 / 5)
        }
        
        separator4.snp.makeConstraints { make in
            make.top.equalTo(termsOfUseButton.snp.bottom)
            make.leading.equalTo(secondBlockView)
            make.trailing.equalTo(secondBlockView)
            make.height.equalTo(1)
        }
        
        privacyPolicyButton.snp.makeConstraints { make in
            make.top.equalTo(separator4.snp.bottom)
            make.leading.equalTo(secondBlockView).offset(1)
            make.trailing.equalTo(secondBlockView).offset(-1)
            make.height.equalTo(333 / 5)
        }

        separator5.snp.makeConstraints { make in
            make.top.equalTo(privacyPolicyButton.snp.bottom)
            make.leading.equalTo(secondBlockView)
            make.trailing.equalTo(secondBlockView)
            make.height.equalTo(1)
        }
        
        aboutUsButton.snp.makeConstraints { make in
            make.top.equalTo(separator5.snp.bottom)
            make.leading.equalTo(secondBlockView).offset(1)
            make.trailing.equalTo(secondBlockView).offset(-1)
            make.height.equalTo(333 / 5)
        }
        
        separator6.snp.makeConstraints { make in
            make.top.equalTo(aboutUsButton.snp.bottom)
            make.leading.equalTo(secondBlockView)
            make.trailing.equalTo(secondBlockView)
            make.height.equalTo(1)
        }
        
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(separator6.snp.bottom)
            make.leading.equalTo(secondBlockView).offset(1)
            make.trailing.equalTo(secondBlockView).offset(-1)
            make.height.equalTo(333 / 5)
        }
    }
    
    @objc private func languageButtonTapped() {
        let alert = UIAlertController(title: "Select Language", message: nil, preferredStyle: .actionSheet)
        let english = UIAlertAction(title: "English", style: .default)
        let kazakh = UIAlertAction(title: "Kazakh", style: .default)
        let russian = UIAlertAction(title: "Russian", style: .default)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(english)
        alert.addAction(kazakh)
        alert.addAction(russian)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    @objc private func notificationsButtonTapped() {
        
    }
    
    @objc private func showDateButtonTapped() {
        showDatedButton.changeSwitch()
    }
    
}
