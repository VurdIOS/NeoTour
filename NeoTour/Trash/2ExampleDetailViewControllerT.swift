////
////  2ExampleDetailViewController.swift
////  NeoTour
////
////  Created by Камаль Атавалиев on 19.02.2024.
////
//
//import UIKit
//
//class ThirdExampleDetailViewController: UIViewController {
//    
//    enum Section: CaseIterable {
//        case topImage
//        case bottomInfo
//    }
//    
//    
//    var tourInfoForTop: [tourModel] = []
//    var tourInfoForBottom: [tourModel] = []
//    
//    private var dataSource: UICollectionViewDiffableDataSource<Section,tourModel>!
//    
//    private lazy var mainViewCollectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
//        collectionView.register(DetailInfoTopCollectionCell.self, forCellWithReuseIdentifier: DetailInfoTopCollectionCell.reuseIdentifier)
//        collectionView.register(DetailInfoBottomCollectionCell.self, forCellWithReuseIdentifier: DetailInfoBottomCollectionCell.reuseIdentifier)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .white
//        
//        return collectionView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .lightAccentColor
//        configureCollectionView()
//        configureDataSource()
//        
//
//    }
//    
//    func createLayout() ->UICollectionViewLayout {
//        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,                                layoutEnvironment: NSCollectionLayoutEnvironment)
//            -> NSCollectionLayoutSection? in
//            let sectionLayoutKind = Section.allCases[sectionIndex]
//            let isWideView = layoutEnvironment.container.effectiveContentSize.width > 500
//            switch sectionLayoutKind {
//            case .topImage:
//                return self.generateTopImageLayout()
//            case .bottomInfo:
//                return self.generateBottomImageLayout()
//            }
//        }
//        
//          return layout
//    }
//    
//    private func generateTopImageLayout() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalHeight(1.0)
//        )
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .absolute(389)
//        )
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//        
//        let section = NSCollectionLayoutSection(group: group)
//        let navigationbar = (navigationController?.navigationBar.frame.height ?? 0) + view.safeAreaInsets.top
//        section.contentInsets = NSDirectionalEdgeInsets(top: -navigationbar  , leading: 0, bottom: 0, trailing: 0)
//
//        
//        return section
//    }
//    
//    private func generateBottomImageLayout() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalHeight(1.0)
//        )
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .fractionalWidth(2)
//        )
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//        
//        let section = NSCollectionLayoutSection(group: group)
//        section.contentInsets = NSDirectionalEdgeInsets(top: -35  , leading: 0, bottom: 0, trailing: 0)
//        
//        return section
//    }
//    
//    private func configureCollectionView() {
//        view.addSubview(mainViewCollectionView)
//            
//        
//        NSLayoutConstraint.activate([
//            mainViewCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            mainViewCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            mainViewCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            mainViewCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//    
//    private func configureDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<Section, tourModel>(collectionView: mainViewCollectionView, cellProvider: { collectionView, indexPath, tourModel in
//            
//            let sectionType = Section.allCases[indexPath.section]
//            switch sectionType {
//            case .topImage:
//                guard let cell = collectionView.dequeueReusableCell(
//                    withReuseIdentifier: DetailInfoTopCollectionCell.reuseIdentifier,
//                    for: indexPath
//                ) as? DetailInfoTopCollectionCell else {
//                    fatalError("Failed to dequeue a cell of type CarouselCollectionViewCell")
//                }
//                cell.get(data: tourModel)
//                return cell
//            case .bottomInfo:
//                guard let cell = collectionView.dequeueReusableCell(
//                    withReuseIdentifier: DetailInfoBottomCollectionCell.reuseIdentifier,
//                    for: indexPath
//                ) as? DetailInfoBottomCollectionCell else {
//                    fatalError("Failed to dequeue a cell of type CarouselCollectionViewCell")
//                }
//                cell.get(data: tourModel)
//                return cell
//            }
//        })
//        var snapshot = NSDiffableDataSourceSnapshot<Section, tourModel>()
//        snapshot.appendSections([.topImage, .bottomInfo])
//        let tourModelTop = tourInfoForTop
//        let tourModelBottom = tourInfoForBottom
//        
//        snapshot.appendItems(tourModelTop, toSection: .topImage)
//        snapshot.appendItems(tourModelBottom, toSection: .bottomInfo)
//        
//        dataSource.apply(snapshot, animatingDifferences: false)
//        
//    }
//}
