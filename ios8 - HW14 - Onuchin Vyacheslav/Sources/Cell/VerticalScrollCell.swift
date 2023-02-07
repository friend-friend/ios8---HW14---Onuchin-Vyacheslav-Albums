//
//  VerticalScrollCell.swift
//  ios8 - HW14 - Onuchin Vyacheslav
//
//  Created by Вячеслав Онучин on 04.02.2023.
//

import UIKit

class VerticalScrollCell: UICollectionViewCell {

    static let identifire = "VerticalScrollCell"

    var model: AlbumModel? {
        didSet {
            iconView.image = UIImage(named: model?.image ?? "")
            nameLabel.text = model?.title
            numberLabel.text = "\((model?.number) ?? 0)"
        }
    }

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
        numberLabel.textAlignment = .right
        numberLabel.textColor = .gray
        return numberLabel
    }()

    private let imageIconRight: UIImageView = {
           let image = UIImageView(image: UIImage(systemName: "chevron.right"))
           image.contentMode = .scaleAspectFit
           image.clipsToBounds = true
           image.tintColor = .systemGray2
           return image
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
        stack.addArrangedSubview(imageIconRight)
    }

    private func setupLayout() {
        stack.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(contentView)
        }

        iconView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.height.equalTo(27)
            make.centerY.equalToSuperview()
        }

        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(iconView.snp.right).offset(15)
        }

        numberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(imageIconRight.snp.left).offset(-5)
        }

        imageIconRight.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.width.height.equalTo(11)
            make.centerY.equalToSuperview()
        }
    }

    // MARK: - Configuration

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
