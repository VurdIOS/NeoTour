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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
