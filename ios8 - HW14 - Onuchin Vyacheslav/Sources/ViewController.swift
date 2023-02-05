//
//  ViewController.swift
//  ios8 - HW14 - Onuchin Vyacheslav
//
//  Created by Вячеслав Онучин on 04.02.2023.
//

import UIKit
import SnapKit

protocol ViewControllerProtocol: AnyObject {

}

class ViewController: UIViewController, ViewControllerProtocol {

    var presenter: Presenter?

    // MARK: - UI Elements

    private lazy var collectionsView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HorizontalScrollCell.self, forCellWithReuseIdentifier: HorizontalScrollCell.identifire)
//        collectionView.register(VerticalScrollCell.self, forCellWithReuseIdentifier: VerticalScrollCell.identifire)
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

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalWidth(1))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                   heightDimension: .fractionalWidth(0.5))
            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
            let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
            return sectionLayout
        }
    }
}

    // MARK: - Actions

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.albumModel[section].count ?? 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0, 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalScrollCell.identifire, for: indexPath) as? HorizontalScrollCell
            cell?.model = presenter?.albumModel[indexPath.section][indexPath.item]
            return cell ?? HorizontalScrollCell()
        case 2, 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalScrollCell.identifire, for: indexPath) as? VerticalScrollCell
            cell?.model = presenter?.albumModel[indexPath.section][indexPath.item]
            return cell ?? VerticalScrollCell()
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalScrollCell.identifire, for: indexPath) as? HorizontalScrollCell
            cell?.model = presenter?.albumModel[indexPath.section][indexPath.item]
            return cell ?? HorizontalScrollCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch indexPath.section
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter?.albumModel.count ?? 4
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

