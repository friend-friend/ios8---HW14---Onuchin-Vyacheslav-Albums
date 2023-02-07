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
        collectionView.register(VerticalScrollCell.self, forCellWithReuseIdentifier: VerticalScrollCell.identifire)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifire)
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
        self.title = "Альбомы"
        view.backgroundColor = .systemBackground
    }

    private func setupHierarchy() {
        view.addSubview(collectionsView)
    }

    private func setupLayout() {
        collectionsView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-6)
        }
    }

    // MARK: - CollectionViewLayout

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, _ in

            switch section {

            case 0:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 12,
                    leading: 5,
                    bottom: 5,
                    trailing: 5
                )

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.5),
                    heightDimension: .absolute(480)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitem: layoutItem,
                    count: 2
                )

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.interGroupSpacing = .zero
                sectionLayout.orthogonalScrollingBehavior = .paging
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(
                    top: 12,
                    leading: 12,
                    bottom: 0,
                    trailing: 12
                )

                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(45)
                )

                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionLayout.boundarySupplementaryItems = [header]

                return sectionLayout

            case 1:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 12,
                    leading: 6,
                    bottom: 6,
                    trailing: 6
                )

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.5),
                    heightDimension: .fractionalWidth(0.7)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitem: layoutItem,
                    count: 1
                )

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.interGroupSpacing = .zero
                sectionLayout.orthogonalScrollingBehavior = .paging
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(
                    top: 12,
                    leading: 6,
                    bottom: 0,
                    trailing: 6
                )

                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(55)
                )

                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionLayout.boundarySupplementaryItems = [header]

                return sectionLayout

            case 2:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(50)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 20,
                    leading: .zero,
                    bottom: .zero,
                    trailing: .zero
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: itemSize,
                    subitem: layoutItem,
                    count: 1
                )

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets.leading = 12

                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: itemSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                header.zIndex = Int.max
                sectionLayout.boundarySupplementaryItems = [header]

                return sectionLayout

            case 3:
                let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(50)
            )

            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(
                top: 20,
                leading: .zero,
                bottom: .zero,
                trailing: .zero
            )

            let layoutGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: itemSize,
                subitem: layoutItem,
                count: 1
            )

            let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets.leading = 12

            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: itemSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            header.zIndex = Int.max
            sectionLayout.boundarySupplementaryItems = [header]

            return sectionLayout
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(
                    top: 12,
                    leading: 6,
                    bottom: 6,
                    trailing: 6
                )

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .estimated(200),
                    heightDimension: .absolute(400)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitem: layoutItem,
                    count: 2
                )

                layoutGroup.interItemSpacing = .fixed(88)

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.interGroupSpacing = .zero
                sectionLayout.orthogonalScrollingBehavior = .paging
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(
                    top: .zero,
                    leading: 12,
                    bottom: 100,
                    trailing: 12
                )

                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(45))
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                header.zIndex = Int.max
                sectionLayout.boundarySupplementaryItems = [header]

                return sectionLayout
            }
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

        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifire, for: indexPath) as! HeaderView
            header.label.text = "Мои альбомы"
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifire, for: indexPath) as! HeaderView
            header.label.text = "Люди и места"
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifire, for: indexPath) as! HeaderView
            header.label.text = "Типы медиафайлов"
            return header
        case 3:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifire, for: indexPath) as! HeaderView
            header.label.text = "Другое"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifire, for: indexPath) as! HeaderView
            header.label.text = "Мои альбомы"
            return header
        }
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

