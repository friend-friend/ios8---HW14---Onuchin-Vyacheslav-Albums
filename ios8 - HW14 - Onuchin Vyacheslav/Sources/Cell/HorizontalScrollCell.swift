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
        label.textColor = .lightGray
        return label
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillEqually
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
        contentView.addSubview(photoImageView)
        stack.addArrangedSubview(namePhotoLabel)
        stack.addArrangedSubview(numberPhotoLabel)
    }
    
    private func setupLayout() {

        photoImageView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(180)
        }

        stack.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalTo(photoImageView.snp.bottom)
        }
    }
    
    // MARK: - Configuration
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}


