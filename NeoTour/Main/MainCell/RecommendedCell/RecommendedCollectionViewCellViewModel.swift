//
//  RecommendedCollectionViewCellViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 23.02.2024.
//

import Foundation

protocol RecommendedCollectionViewCellViewModelProtocol {
    var title: String { get }
    var isImageLoaded: ((Data?) -> Void)? { get set }
    func fetchImage()
}

class RecommendedCollectionViewCellViewModel: RecommendedCollectionViewCellViewModelProtocol {
    var title: String {
        tour.title
    }
    
    var isImageLoaded: ((Data?) -> Void)?
    
    
    private let tour: Tour
    private let network = NetworkLayer.shared
    
    func fetchImage() {
        network.fetchImage(from: tour.image) {[unowned self] result in
            switch result {
            case .success(let imageData):
                self.isImageLoaded?(imageData)
            case.failure(_):
                self.isImageLoaded?(nil)
                
            }
        }
    }
    
    required init(tour: Tour) {
        self.tour = tour
    }
}
