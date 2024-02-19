//
//  2ExampleDetailViewController.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 19.02.2024.
//

import UIKit

class ThirdExampleDetailViewController: UIViewController {
    
    enum Section: CaseIterable {
        case topImage
        case bottomInfo
    }
    
    
    let mock = MockFiles()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section,tourModel>!
    
    private lazy var mainViewCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(DetailInfoTopCollectionCell.self, forCellWithReuseIdentifier: DetailInfoTopCollectionCell.id)
        collectionView.register(DetailInfoBottomCollectionCell.self, forCellWithReuseIdentifier: DetailInfoBottomCollectionCell.id)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightAccentColor
        configureCollectionView()
        configureDataSource()

    }
    
    func createLayout() ->UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,                                layoutEnvironment: NSCollectionLayoutEnvironment)
            -> NSCollectionLayoutSection? in
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .topImage:
                return self.generateTopImageLayout()
            case .bottomInfo:
                return self.generateBottomImageLayout()
            }
        }
        
          return layout
    }
    
    private func generateTopImageLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.5)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    private func generateBottomImageLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.5)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
    }
    
    private func configureCollectionView() {
        view.addSubview(mainViewCollectionView)
        
        NSLayoutConstraint.activate([
            mainViewCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            mainViewCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainViewCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainViewCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, tourModel>(collectionView: mainViewCollectionView, cellProvider: { collectionView, indexPath, tourModel in
            
            let sectionType = Section.allCases[indexPath.section]
            switch sectionType {
            case .topImage:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: DetailInfoTopCollectionCell.id,
                    for: indexPath
                ) as? DetailInfoTopCollectionCell else {
                    fatalError("Failed to dequeue a cell of type CarouselCollectionViewCell")
                }
                cell.get(data: tourModel)
                return cell
            case .bottomInfo:
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: DetailInfoBottomCollectionCell.id,
                    for: indexPath
                ) as? DetailInfoBottomCollectionCell else {
                    fatalError("Failed to dequeue a cell of type CarouselCollectionViewCell")
                }
                cell.get(data: tourModel)
                return cell
            }
        })
        var snapshot = NSDiffableDataSourceSnapshot<Section, tourModel>()
        let tourModel = mock.mockForDetailViewTop
        
        snapshot.appendSections([Section.topImage])
        snapshot.appendItems(tourModel)
        
        snapshot.appendSections([Section.bottomInfo])
        snapshot.appendItems(tourModel)
        
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
}
