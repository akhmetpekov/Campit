//
//  AllViewController.swift
//  Campit
//
//  Created by Erik on 19.09.2023.
//

import UIKit
import SnapKit

final class AllViewController: UIViewController {
    
    private lazy var burgerButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: Resources.Constants.Size.main, weight: .medium, scale: .default)
        let burgerIcon = UIImage(systemName: Resources.Images.burgerIcon, withConfiguration: config)
        burgerIcon?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        button.setBackgroundImage(burgerIcon, for: .normal)
        button.tintColor = Resources.Colors.active
        button.addTarget(self, action: #selector(burgerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("SHARE", for: .normal)
        button.titleLabel?.font = UIFont(name: Resources.Fonts.main, size: 18)
        button.titleLabel?.textColor = Resources.Colors.active
        button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: Resources.Constants.Size.main, weight: .medium, scale: .default)
        let plusIcon = UIImage(systemName: Resources.Images.addIcon, withConfiguration: config)
        plusIcon?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        button.setBackgroundImage(plusIcon, for: .normal)
        button.tintColor = Resources.Colors.active
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .default)
        let customFont = UIFont(name: Resources.Fonts.main, size: 40)
        let customColor = Resources.Colors.active
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: customFont as Any,
            .foregroundColor: customColor as Any
        ]
        let attributedTitle = NSAttributedString(string: "all habits", attributes: titleAttributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.configuration = .plain()
        button.configuration?.image = UIImage(systemName: Resources.Images.chevronDown, withConfiguration: config)
        button.configuration?.baseForegroundColor = customColor
        button.configuration?.imagePlacement = .trailing
        button.configuration?.imagePadding = 10
        button.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = Resources.Colors.primary
        view.addSubview(burgerButton)
        view.addSubview(plusButton)
        view.addSubview(shareButton)
        view.addSubview(filterButton)
    }
    
    private func makeConstraints() {
        burgerButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.leading)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-10)
        }
        
        plusButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(Resources.Constants.trailing)
            make.centerY.equalTo(burgerButton)
        }
        
        shareButton.snp.makeConstraints { make in
            make.centerY.equalTo(burgerButton)
            make.trailing.equalTo(plusButton.snp.leading).offset(-10)
        }
        
        filterButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.titleLeading)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Resources.Constants.titleTop)
        }
    }
    
    @objc private func burgerButtonTapped() {
        print("burgerButtonTapped")
    }
    
    @objc private func shareButtonTapped() {
        print("shareButtonTapped")
    }
    
    @objc private func plusButtonTapped() {
        let vc = AddNewCommitController()
        print("tapped")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    @objc private func filterButtonTapped() {
        print("hi")
    }
}
