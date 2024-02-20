////
////  ExampleViewController.swift
////  NeoTour
////
////  Created by Камаль Атавалиев on 18.02.2024.
////
//
//import UIKit
//
//class ExampleViewController: UIViewController {
//  static let sectionHeaderElementKind = "section-header-element-kin"
//  
//  enum Section: String, CaseIterable {
//    case tourCategories = "tour Categories"
//    case tours = "tours"
//    case recommendedTours = "recommended Tours"
//  }
//  
//  var dataSource: UICollectionViewDiffableDataSource<Section, tourModel>! = nil
//  var tourCollectionView: UICollectionView! = nil
//  
//    let mock = MockFiles()
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    navigationItem.title = "Discovery"
//    configureCollectionView()
//    configureDataSource()
//  }
//}
//
//extension ExampleViewController {
//  func configureCollectionView() {
//    let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
//      view.addSubview(collectionView)
//      collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//      collectionView.backgroundColor = .systemBackground
//      collectionView.delegate = self
//      collectionView.dataSource = self
//      collectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: CarouselCollectionViewCell.id)
//      collectionView.register(GaleryCollectionViewCell.self, forCellWithReuseIdentifier: GaleryCollectionViewCell.id)
//      tourCollectionView = collectionView
////    collectionView.register(
////      HeaderView.self,
////      forSupplementaryViewOfKind: AlbumsViewController.sectionHeaderElementKind,
////      withReuseIdentifier: HeaderView.reuseIdentifier)
//  }
//  
//  func configureDataSource() {
//    dataSource = UICollectionViewDiffableDataSource
//    <Section, tourModel>(collectionView: tourCollectionView) {
//      (collectionView: UICollectionView, indexPath: IndexPath, tourModel: tourModel) -> UICollectionViewCell? in
//      
//      let sectionType = Section.allCases[indexPath.section]
//      switch sectionType {
//      case .tourCategories:
//          let cell = collectionView.dequeueReusableCell(
//              withReuseIdentifier: CarouselCollectionViewCell.id,
//              for: indexPath
//          ) as! CarouselCollectionViewCell
//          cell.get(data: self.mock.mockForCarousel[indexPath.item])
//        return cell
//        
//      case .tours:
//          let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: GaleryCollectionViewCell.id,
//            for: indexPath
//          ) as! GaleryCollectionViewCell
//          let mockFiles = self.mock.mockForGalery[indexPath.row]
//          cell.get(label: mockFiles.title, image: mockFiles.image)
//          return cell
//          
//      case .recommendedTours:
//          let cell = collectionView.dequeueReusableCell(
//              withReuseIdentifier: GaleryCollectionViewCell.id,
//              for: indexPath
//          ) as! GaleryCollectionViewCell
//          let mockFiles2 = self.mock.mockForRecommended[indexPath.row]
//          cell.get(label: mockFiles2.title, image: mockFiles2.image)
//          cell.setupCell(labelFont: UIFont(name: "SFProDisplay-Semibold", size: 14)!, cornerRadius: 10, labelLeadingConstant: 12)
//          return cell
//      }
//    }
////    dataSource.supplementaryViewProvider = { (
////      collectionView: UICollectionView,
////      kind: String,
////      indexPath: IndexPath)
////      -> UICollectionReusableView? in
////      
////      guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
////        ofKind: kind,
////        withReuseIdentifier: HeaderView.reuseIdentifier,
////        for: indexPath) as? HeaderView else {
////        fatalError("Cannot create header view")
////      }
//      
////      supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
////      return supplementaryView
////    }
//    
////    let snapshot = snapshotForCurrentState()
////    dataSource.apply(snapshot, animatingDifferences: false)
//  }
//  
//  func generateLayout() -> UICollectionViewLayout {
//    let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
//                                                        layoutEnvironment: NSCollectionLayoutEnvironment)
//      -> NSCollectionLayoutSection? in
//      let isWideView = layoutEnvironment.container.effectiveContentSize.width > 500
//      
//      let sectionLayoutKind = Section.allCases[sectionIndex]
//      switch (sectionLayoutKind) {
//      case .tourCategories: return self.generateToursLayout(
//        isWide: isWideView)
//      case .tours: return self.generateToursCategoryLayout()
//      case .recommendedTours: return self.generateRecommendedToursLayout(isWide: isWideView)
//      }
//    }
//    return layout
//  }
//  
//  
//  func generateRecommendedToursLayout(isWide: Bool) -> NSCollectionLayoutSection {
//    let itemSize = NSCollectionLayoutSize(
//      widthDimension: .fractionalWidth(1.0),
//      heightDimension: .fractionalHeight(1.0))
//    let item = NSCollectionLayoutItem(layoutSize: itemSize)
//    item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//    
//    let groupHeight = NSCollectionLayoutDimension.fractionalWidth(isWide ? 0.25 : 0.5)
//    let groupSize = NSCollectionLayoutSize(
//      widthDimension: .fractionalWidth(1.0),
//      heightDimension: groupHeight)
//    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: isWide ? 4 : 2)
//    
//    let headerSize = NSCollectionLayoutSize(
//      widthDimension: .fractionalWidth(1.0),
//      heightDimension: .estimated(44))
//    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//      layoutSize: headerSize,
//      elementKind: ExampleViewController.sectionHeaderElementKind,
//      alignment: .top)
//    
//    let section = NSCollectionLayoutSection(group: group)
//    section.boundarySupplementaryItems = [sectionHeader]
//    
//    return section
//  }
//  func generateToursLayout(isWide: Bool) -> NSCollectionLayoutSection {
//    let itemSize = NSCollectionLayoutSize(
//      widthDimension: .fractionalWidth(1.0),
//      heightDimension: .fractionalWidth(2/3))
//    let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//    let groupFractionalWidth = isWide ? 0.475 : 0.95
//    let groupFractionalHeight: Float = isWide ? 1/3 : 2/3
//    let groupSize = NSCollectionLayoutSize(
//      widthDimension: .fractionalWidth(CGFloat(groupFractionalWidth)),
//      heightDimension: .fractionalWidth(CGFloat(groupFractionalHeight)))
//    let group = NSCollectionLayoutGroup.horizontal(
//      layoutSize: groupSize,
//      subitem: item,
//      count: 1)
//    group.contentInsets = NSDirectionalEdgeInsets(
//      top: 5,
//      leading: 5,
//      bottom: 5,
//      trailing: 5)
//    
//    let headerSize = NSCollectionLayoutSize(
//      widthDimension: .fractionalWidth(1.0),
//      heightDimension: .estimated(44))
//    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//      layoutSize: headerSize,
//      elementKind: ExampleViewController.sectionHeaderElementKind,
//      alignment: .top)
//    
//    let section = NSCollectionLayoutSection(group: group)
//    section.boundarySupplementaryItems = [sectionHeader]
//    section.orthogonalScrollingBehavior = .groupPaging
//    
//    return section
//  }
//  
//  func generateToursCategoryLayout() -> NSCollectionLayoutSection {
//    let itemSize = NSCollectionLayoutSize(
//      widthDimension: .fractionalWidth(1.0),
//      heightDimension: .fractionalWidth(1.0))
//    let item = NSCollectionLayoutItem(layoutSize: itemSize)
//    
//    let groupSize = NSCollectionLayoutSize(
//      widthDimension: .absolute(140),
//      heightDimension: .absolute(186))
//    let group = NSCollectionLayoutGroup.vertical(
//      layoutSize: groupSize,
//      subitem: item,
//      count: 1)
//    group.contentInsets = NSDirectionalEdgeInsets(
//      top: 5,
//      leading: 5,
//      bottom: 5,
//      trailing: 5)
//    
//    let headerSize = NSCollectionLayoutSize(
//      widthDimension: .fractionalWidth(1.0),
//      heightDimension: .estimated(44))
//    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//      layoutSize: headerSize,
//      elementKind: ExampleViewController.sectionHeaderElementKind,
//      alignment: .top)
//    
//    let section = NSCollectionLayoutSection(group: group)
//    section.boundarySupplementaryItems = [sectionHeader]
//    section.orthogonalScrollingBehavior = .groupPaging
//    
//    return section
//  }
//  
//  
//  
//    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, tourModel> {
//        let carousel = mock.mockForCarousel
//        let tours = mock.mockForGalery
//        let recommendedTour = mock.mockForRecommended
//        
//        var snapshot = NSDiffableDataSourceSnapshot<Section, tourModel>()
//        
////        snapshot.appendSections([Section.tourCategories])
////        snapshot.appendItems(carousel)
//        
//        snapshot.appendSections([.tours])
//        snapshot.appendItems(tours)
//        
//        snapshot.appendSections([.recommendedTours])
//        snapshot.appendItems(recommendedTour)
//        return snapshot
//    }
//    
//}
//
//extension ExampleViewController: UICollectionViewDelegate {
//  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////    guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
////    let albumDetailVC = AlbumDetailViewController(withPhotosFromDirectory: item.albumURL)
////    navigationController?.pushViewController(albumDetailVC, animated: true)
//  }
//}
//
//extension ExampleViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        10
//    }
//    
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let sectionType = Section.allCases[indexPath.section]
//        switch sectionType {
//        case .tourCategories:
//            let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: CarouselCollectionViewCell.id,
//                for: indexPath
//            ) as! CarouselCollectionViewCell
//            cell.get(data: self.mock.mockForCarousel[indexPath.item])
//            return cell
//            
//        case .tours:
//            let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: GaleryCollectionViewCell.id,
//                for: indexPath
//            ) as! GaleryCollectionViewCell
//            let mockFiles = self.mock.mockForGalery[indexPath.row]
//            cell.get(label: mockFiles.title, image: mockFiles.image)
//            return cell
//            
//        case .recommendedTours:
//            let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: GaleryCollectionViewCell.id,
//                for: indexPath
//            ) as! GaleryCollectionViewCell
//            let mockFiles2 = self.mock.mockForRecommended[indexPath.row]
//            cell.get(label: mockFiles2.title, image: mockFiles2.image)
//            cell.setupCell(labelFont: UIFont(name: "SFProDisplay-Semibold", size: 14)!, cornerRadius: 10, labelLeadingConstant: 12)
//            return cell
//        }
//    }
//}
//
