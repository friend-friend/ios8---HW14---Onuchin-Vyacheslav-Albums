//
//  VerticalScrollCell.swift
//  ios8 - HW14 - Onuchin Vyacheslav
//
//  Created by Вячеслав Онучин on 04.02.2023.
//

import UIKit

class VerticalScrollCell: UICollectionViewCell {

    static let identifire = "VerticalScrollCell"

    // MARK: - Outlets

    lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 20, weight: .regular)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .systemBlue
        return nameLabel
    }()

    lazy var numberLabel: UILabel = {
        let numberLabel = UILabel()
        numberLabel.font = .systemFont(ofSize: 17, weight: .regular)
        numberLabel.textAlignment = .left
        numberLabel.textColor = .gray
        return numberLabel
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        let image = UIImage(systemName: "chevron.right",
                            withConfiguration:  UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold))?
                            .withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        return button
    }()

    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: .zero)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(stack)
        stack.addArrangedSubview(iconView)
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(button)
    }

    private func setupLayout() {
        stack.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(contentView)
        }
    }
}
