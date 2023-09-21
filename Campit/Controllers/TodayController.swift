//
//  TodayViewController.swift
//  Campit
//
//  Created by Erik on 19.09.2023.
//

import UIKit
import SnapKit

final class TodayController: UIViewController {
    
    private lazy var topLabel: UIButton = {
        let button = UIButton()
        let customFont = UIFont(name: Resources.Fonts.main, size: 40)
        let customColor = Resources.Colors.active
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: customFont as Any,
            .foregroundColor: customColor as Any
        ]
        let attributedTitle = NSAttributedString(string: "today", attributes: titleAttributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.configuration = .plain()
        button.configuration?.baseForegroundColor = customColor
        button.addTarget(self, action: #selector(topLabelTapped), for: .touchUpInside)
        return button
    }()
    
    private let citate: UITextView = {
        let textView = UITextView()
        textView.text = "Practice isn't the thing you do once you're good. It's the thing you do that makes you good."
        textView.textColor = Resources.Colors.citate
        textView.font = UIFont(name: Resources.Fonts.tab, size: 22)
        textView.backgroundColor = .clear
        textView.textAlignment = .left
        return textView
    }()
    
    private let author: UILabel = {
        let label = UILabel()
        label.text = "─ malcom gladwell".uppercased()
        label.textColor = Resources.Colors.author
        label.font = UIFont(name: Resources.Fonts.tab, size: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let roundedRectangle: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = Resources.Colors.secondary
        rectangle.layer.masksToBounds = true
        rectangle.layer.borderColor = Resources.Colors.citate.cgColor
        rectangle.layer.borderWidth = 1
        return rectangle
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        roundedRectangle.layer.cornerRadius = roundedRectangle.frame.height / 4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        makeConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = Resources.Colors.primary
        view.addSubview(topLabel)
        view.addSubview(citate)
        view.addSubview(author)
        view.addSubview(roundedRectangle)
    }
    
    private func makeConstraints() {
        topLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.titleLeading)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Resources.Constants.titleTop)
        }
        
        citate.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(-6)
            make.leading.equalToSuperview().offset(Resources.Constants.leading)
            make.width.equalTo(Int(view.bounds.width) - Resources.Constants.leading * 2)
            make.height.equalTo(100)
        }
        
        author.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Resources.Constants.leading + 5)
            make.top.equalTo(citate.snp.bottom).offset(-6)
        }
        
        roundedRectangle.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width / 1.5)
            make.height.equalTo(view.frame.width / 1.5)
            make.top.equalTo(author.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(Resources.Constants.leading)
        }
    }
    
    @objc private func topLabelTapped() {
        
    }
}
