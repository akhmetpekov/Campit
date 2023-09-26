//
//  CustomCollectionViewCell.swift
//  Campit
//
//  Created by Erik on 22.09.2023.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "collectionViewCell"
    
    private let roundedRectangle: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = Resources.Colors.secondary
        rectangle.layer.masksToBounds = true
        rectangle.layer.borderColor = Resources.Colors.citate.cgColor
        rectangle.layer.borderWidth = 1
        return rectangle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func configure(width: CGFloat) {
        addSubview(roundedRectangle)
        makeConstraints()
        applyRoundedCorners(width: width)
    }
    
    func applyRoundedCorners(width: CGFloat) {
        roundedRectangle.layer.cornerRadius = width / 4
    }
    
    private func makeConstraints() {
        roundedRectangle.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
