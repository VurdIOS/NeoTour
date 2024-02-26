//
//  RecommendedCollectionViewCellViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 23.02.2024.
//

import UIKit
#warning("Убрать юайкит и присвоить картинке тип дата")
protocol RecommendedCollectionViewCellViewModelProtocol {
    var image: UIImage { get }
    var title: String { get }
}

class RecommendedCollectionViewCellViewModel: RecommendedCollectionViewCellViewModelProtocol {
    var image: UIImage {
//        tour.image
        UIImage()
    }
    
    var title: String {
        tour.title
    }
    
    private let tour: Tour
    
    required init(tour: Tour) {
        self.tour = tour
    }
}
