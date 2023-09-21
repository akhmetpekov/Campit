//
//  AddNewCommitController.swift
//  Campit
//
//  Created by Erik on 20.09.2023.
//

import UIKit

final class AddNewCommitController: UIViewController {
    
    private var everyDayButtonIsOn: Bool = false
    private var everyOtherDayButtonIsOn: Bool = false
    private var monButtonIsOn: Bool = false
    private var tueButtonIsOn: Bool = false
    private var wedButtonIsOn: Bool = false
    private var thuButtonIsOn: Bool = false
    private var friButtonIsOn: Bool = false
    private var satButtonIsOn: Bool = false
    private var sunButtonIsOn: Bool = false
    private var isEven: Bool = false
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: Resources.Constants.Size.main, weight: .medium, scale: .default)
        button.configuration = .plain()
        button.configuration?.image = UIImage(systemName: Resources.Images.dismissIcon, withConfiguration: config)
        button.configuration?.baseForegroundColor = Resources.Colors.active
        button.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you commit to do?"
        label.textColor = Resources.Colors.active
        label.font = UIFont(name: Resources.Fonts.main, size: 25)
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: Resources.Fonts.tab, size: 26)
        textField.textColor = Resources.Colors.active
        textField.attributedPlaceholder = NSAttributedString(string: "Call mom", attributes: [NSAttributedString.Key.foregroundColor: Resources.Colors.inactive])
        textField.autocapitalizationType = .sentences
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.keyboardType = .alphabet
        textField.layer.borderColor = Resources.Colors.active.cgColor
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        textField.setLeftPaddingPoints(8)
        return textField
    }()
    
    private let intervalLabel: UILabel = {
        let label = UILabel()
        label.text = "How often?"
        label.textColor = Resources.Colors.active
        label.font = UIFont(name: Resources.Fonts.main, size: 25)
        return label
    }()
    
    private lazy var everyDayButton: CustomButton = {
        let button = CustomButton(title: "every day")
        button.addTarget(self, action: #selector(everyDayButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var everyOtherDayButton: CustomButton = {
        let button = CustomButton(title: "every other day")
        button.addTarget(self, action: #selector(everyOtherDayButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var monButton: CustomButton = {
        let button = CustomButton(title: "mon")
        button.addTarget(self, action: #selector(monButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var tueButton: CustomButton = {
        let button = CustomButton(title: "tue")
        button.addTarget(self, action: #selector(tueButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var wedButton: CustomButton = {
        let button = CustomButton(title: "wed")
        button.addTarget(self, action: #selector(wedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var thuButton: CustomButton = {
        let button = CustomButton(title: "thu")
        button.addTarget(self, action: #selector(thuButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var friButton: CustomButton = {
        let button = CustomButton(title: "fri")
        button.addTarget(self, action: #selector(friButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var satButton: CustomButton = {
        let button = CustomButton(title: "sat")
        button.addTarget(self, action: #selector(satButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var sunButton: CustomButton = {
        let button = CustomButton(title: "sun")
        button.addTarget(self, action: #selector(sunButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var confirmButton: CustomButton = {
        let button = CustomButton(title: "confirm", icon: Resources.Images.checkmarkIcon, font: UIFont(name: Resources.Fonts.main, size: 30))
        button.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        button.changeBorderColor(color: Resources.Colors.greenTint)
        button.changeTitleColor(color: Resources.Colors.active, font: UIFont(name: Resources.Fonts.main, size: 30))
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeconstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nameTextField.layer.cornerRadius = nameTextField.bounds.height / 3
        everyDayButton.layer.cornerRadius = everyDayButton.bounds.height / 3
        everyOtherDayButton.layer.cornerRadius = everyOtherDayButton.bounds.height / 3
        monButton.layer.cornerRadius = monButton.bounds.height / 3
        tueButton.layer.cornerRadius = everyOtherDayButton.bounds.height / 3
        wedButton.layer.cornerRadius = wedButton.bounds.height / 3
        thuButton.layer.cornerRadius = thuButton.bounds.height / 3
        friButton.layer.cornerRadius = friButton.bounds.height / 3
        satButton.layer.cornerRadius = satButton.bounds.height / 3
        sunButton.layer.cornerRadius = sunButton.bounds.height / 3
        confirmButton.layer.cornerRadius = sunButton.bounds.height / 2
    }
    
    private func setupUI() {
        view.backgroundColor = Resources.Colors.primary
        view.addSubview(dismissButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(intervalLabel)
        view.addSubview(everyDayButton)
        view.addSubview(everyOtherDayButton)
        view.addSubview(monButton)
        view.addSubview(tueButton)
        view.addSubview(wedButton)
        view.addSubview(thuButton)
        view.addSubview(friButton)
        view.addSubview(satButton)
        view.addSubview(sunButton)
        view.addSubview(confirmButton)
        
    }
    
    private func makeconstraints() {
        dismissButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.leading)
            make.top.equalTo(dismissButton.snp.bottom).offset(15)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.leading)
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            make.trailing.equalToSuperview().offset(Resources.Constants.trailing)
            make.height.equalTo(50)
        }
        
        intervalLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.leading)
            make.top.equalTo(nameTextField.snp.bottom).offset(15)
        }
        
        everyDayButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.leading)
            make.top.equalTo(intervalLabel.snp.bottom).offset(15)
            make.width.equalTo(Int(view.frame.width) / 2 - Resources.Constants.leading - 4)
            make.height.equalTo(50)
        }
        
        everyOtherDayButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(Resources.Constants.trailing)
            make.top.equalTo(intervalLabel.snp.bottom).offset(15)
            make.width.equalTo(Int(view.frame.width) / 2 - Resources.Constants.leading - 4)
            make.height.equalTo(50)
        }
        
        monButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.leading)
            make.top.equalTo(everyOtherDayButton.snp.bottom).offset(15)
            make.width.equalTo((Int(view.frame.width) - Resources.Constants.leading * 2) / 5 - 8)
            make.height.equalTo(50)
        }
        
        friButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(Resources.Constants.trailing)
            make.centerY.equalTo(monButton)
            make.width.equalTo((Int(view.frame.width) - Resources.Constants.leading * 2) / 5 - 8)
            make.height.equalTo(50)
        }
        
        tueButton.snp.makeConstraints { make in
            make.leading.equalTo(monButton.snp.trailing).offset(11)
            make.centerY.equalTo(monButton)
            make.width.equalTo((Int(view.frame.width) - Resources.Constants.leading * 2) / 5 - 8)
            make.height.equalTo(50)
        }
        
        wedButton.snp.makeConstraints { make in
            make.leading.equalTo(tueButton.snp.trailing).offset(11)
            make.centerY.equalTo(monButton)
            make.width.equalTo((Int(view.frame.width) - Resources.Constants.leading * 2) / 5 - 8)
            make.height.equalTo(50)
        }
        
        thuButton.snp.makeConstraints { make in
            make.leading.equalTo(wedButton.snp.trailing).offset(11)
            make.centerY.equalTo(monButton)
            make.width.equalTo((Int(view.frame.width) - Resources.Constants.leading * 2) / 5 - 8)
            make.height.equalTo(50)
        }
        
        satButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.leading)
            make.top.equalTo(friButton.snp.bottom).offset(15)
            make.width.equalTo((Int(view.frame.width) - Resources.Constants.leading * 2) / 5 - 8)
            make.height.equalTo(50)
        }
        
        sunButton.snp.makeConstraints { make in
            make.leading.equalTo(satButton.snp.trailing).offset(11)
            make.centerY.equalTo(satButton)
            make.width.equalTo((Int(view.frame.width) - Resources.Constants.leading * 2) / 5 - 8)
            make.height.equalTo(50)
        }
        
        confirmButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.width.equalTo(view.frame.width / 2)
            make.height.equalTo(60)
        }
    }
    
    @objc private func dismissTapped() {
        dismiss(animated: true)
    }
    
    @objc private func everyDayButtonTapped() {
        everyDayButtonIsOn = !everyDayButtonIsOn
        if everyOtherDayButtonIsOn {
            monButtonIsOn = false
            tueButtonIsOn = false
            wedButtonIsOn = false
            thuButtonIsOn = false
            friButtonIsOn = false
            satButtonIsOn = false
            sunButtonIsOn = false
            monButtonTapped()
            tueButtonTapped()
            wedButtonTapped()
            thuButtonTapped()
            friButtonTapped()
            satButtonTapped()
            sunButtonTapped()
            everyOtherDayButtonTapped()
        }
        if everyDayButtonIsOn {
            everyDayButton.changeTitleColor(color: Resources.Colors.active)
            everyDayButton.changeBorderColor(color: Resources.Colors.active)
            monButtonTapped()
            tueButtonTapped()
            wedButtonTapped()
            thuButtonTapped()
            friButtonTapped()
            satButtonTapped()
            sunButtonTapped()
        } else {
            everyDayButton.changeTitleColor(color: Resources.Colors.inactive)
            everyDayButton.changeBorderColor(color: Resources.Colors.inactive)
            monButtonTapped()
            tueButtonTapped()
            wedButtonTapped()
            thuButtonTapped()
            friButtonTapped()
            satButtonTapped()
            sunButtonTapped()
        }
    }
    
    @objc private func everyOtherDayButtonTapped() {
        if everyDayButtonIsOn {
            everyOtherDayButton.changeTitleColor(color: Resources.Colors.inactive)
            everyOtherDayButton.changeBorderColor(color: Resources.Colors.inactive)
            return
        }
        isEven = !isEven
        everyOtherDayButtonIsOn = true
        if isEven {
            if tueButtonIsOn {
                tueButtonTapped()
                thuButtonTapped()
                satButtonTapped()
            }
            everyOtherDayButton.changeTitleColor(color: Resources.Colors.active)
            everyOtherDayButton.changeBorderColor(color: Resources.Colors.active)
            monButtonTapped()
            wedButtonTapped()
            friButtonTapped()
        } else {
            if monButtonIsOn {
                monButtonTapped()
                wedButtonTapped()
                friButtonTapped()
            }
            tueButtonTapped()
            thuButtonTapped()
            satButtonTapped()
        }
    }
    
    @objc private func monButtonTapped() {
        monButtonIsOn = !monButtonIsOn
        if monButtonIsOn {
            monButton.changeTitleColor(color: Resources.Colors.active)
            monButton.changeBorderColor(color: Resources.Colors.active)
        } else {
            monButton.changeTitleColor(color: Resources.Colors.inactive)
            monButton.changeBorderColor(color: Resources.Colors.inactive)
        }
    }
    
    @objc private func tueButtonTapped() {
        tueButtonIsOn = !tueButtonIsOn
        if tueButtonIsOn {
            tueButton.changeTitleColor(color: Resources.Colors.active)
            tueButton.changeBorderColor(color: Resources.Colors.active)
        } else {
            tueButton.changeTitleColor(color: Resources.Colors.inactive)
            tueButton.changeBorderColor(color: Resources.Colors.inactive)
        }
    }
    
    @objc private func wedButtonTapped() {
        wedButtonIsOn = !wedButtonIsOn
        if wedButtonIsOn {
            wedButton.changeTitleColor(color: Resources.Colors.active)
            wedButton.changeBorderColor(color: Resources.Colors.active)
        } else {
            wedButton.changeTitleColor(color: Resources.Colors.inactive)
            wedButton.changeBorderColor(color: Resources.Colors.inactive)
        }
    }
    
    @objc private func thuButtonTapped() {
        thuButtonIsOn = !thuButtonIsOn
        if thuButtonIsOn {
            thuButton.changeTitleColor(color: Resources.Colors.active)
            thuButton.changeBorderColor(color: Resources.Colors.active)
        } else {
            thuButton.changeTitleColor(color: Resources.Colors.inactive)
            thuButton.changeBorderColor(color: Resources.Colors.inactive)
        }
    }
    
    @objc private func friButtonTapped() {
        friButtonIsOn = !friButtonIsOn
        if friButtonIsOn {
            friButton.changeTitleColor(color: Resources.Colors.active)
            friButton.changeBorderColor(color: Resources.Colors.active)
        } else {
            friButton.changeTitleColor(color: Resources.Colors.inactive)
            friButton.changeBorderColor(color: Resources.Colors.inactive)
        }
    }
    
    @objc private func satButtonTapped() {
        satButtonIsOn = !satButtonIsOn
        if satButtonIsOn {
            satButton.changeTitleColor(color: Resources.Colors.active)
            satButton.changeBorderColor(color: Resources.Colors.active)
        } else {
            satButton.changeTitleColor(color: Resources.Colors.inactive)
            satButton.changeBorderColor(color: Resources.Colors.inactive)
        }
    }
    
    @objc private func sunButtonTapped() {
        sunButtonIsOn = !sunButtonIsOn
        if sunButtonIsOn {
            sunButton.changeTitleColor(color: Resources.Colors.active)
            sunButton.changeBorderColor(color: Resources.Colors.active)
        } else {
            sunButton.changeTitleColor(color: Resources.Colors.inactive)
            sunButton.changeBorderColor(color: Resources.Colors.inactive)
        }
    }
    
    @objc private func confirmButtonTapped() {
        
    }
}
