//
//  CollectionReusableView.swift
//  ios8 - HW14 - Onuchin Vyacheslav
//
//  Created by Вячеслав Онучин on 05.02.2023.
//

import UIKit

class HeaderView: UICollectionReusableView {
        static let identifire = "HeaderView"

    // MARK: - Outlets

    lazy var lineSeparators: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        return line
    }()

    lazy var label: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 22, weight: .semibold)
        lable.textAlignment = .left
        lable.textColor = .black
        return lable
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(lineSeparators)
        addSubview(label)
    }

    private func setupLayout() {
        label.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.bottom.equalTo(self)
        }
        lineSeparators.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(label.snp.bottom).inset(-10)
            make.left.equalTo(label.snp.left)
            make.right.equalToSuperview()
        }
    }
}
