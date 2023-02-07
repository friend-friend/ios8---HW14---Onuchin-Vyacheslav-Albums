//
//  HorizontalScrollCell.swift
//  ios8 - HW14 - Onuchin Vyacheslav
//
//  Created by Вячеслав Онучин on 04.02.2023.
//

import UIKit

class HorizontalScrollCell: UICollectionViewCell {
    
    static let identifire = "HorizontalScrollCell"

    var model: AlbumModel? {
        didSet {
            photoImageView.image = UIImage(named: model?.image ?? "")
            namePhotoLabel.text = model?.title
            numberPhotoLabel.text = "\((model?.number) ?? 0)"
        }
    }
    
    // MARK: - Outlets
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var namePhotoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        return label
    }()
    
    lazy var numberPhotoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        label.textColor = .gray
        return label
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.backgroundColor = .white
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
        stack.addArrangedSubview(photoImageView)
        stack.addArrangedSubview(namePhotoLabel)
        stack.addArrangedSubview(numberPhotoLabel)
    }
    
    private func setupLayout() {
        stack.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview().inset(15)
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }

        photoImageView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.bottom.equalTo(contentView).offset(-25)
        }

        namePhotoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }

        numberPhotoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(namePhotoLabel.snp.bottom)
        }
    }
    
    // MARK: - Configuration
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}


