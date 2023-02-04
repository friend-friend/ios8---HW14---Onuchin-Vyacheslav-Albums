//
//  ViewController.swift
//  ios8 - HW14 - Onuchin Vyacheslav
//
//  Created by Вячеслав Онучин on 04.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - UI Elements

    private lazy var collectionsView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "item")
        return collectionView
    }()

    // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupView() {
        view.backgroundColor = .cyan
    }

    private func setupHierarchy() {
        view.addSubview(collectionsView)
    }

    private func setupLayout() {
        collectionsView.snp.makeConstraints { make in
            make.right.left.top.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }

    // MARK: - CollectionViewLayout

//    private func createLayout() -> UICollectionViewCompositionalLayout {
//        return UICollectionViewCompositionalLayout { (section, _) NSCollectionLayoutSection in
//            switch section {
//            case 0:
//            case 1:
//            case 2:
//            default:
//            }
//        }
//    }
}

    // MARK: - Actions

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlbumModel.modelArray[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AlbumModel.modelArray.count
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

