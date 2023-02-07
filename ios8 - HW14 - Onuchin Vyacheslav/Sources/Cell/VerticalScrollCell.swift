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
            iconView.image = UIImage(systemName: model?.image ?? "")
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
        addSubview(iconView)
        addSubview(nameLabel)
        addSubview(numberLabel)
        addSubview(imageIconRight)
    }

    private func setupLayout() {

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
            make.right.equalTo(imageIconRight.snp.left)
        }

        imageIconRight.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-5)
            make.width.height.equalTo(18)
            make.centerY.equalToSuperview()
        }
    }

    // MARK: - Configuration

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
