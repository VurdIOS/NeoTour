//
//  TourDetailsBottomCollectionCellViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 23.02.2024.
//

import UIKit
#warning("Убрать юайкит и присвоить картинке тип дата")
protocol TourDetailsBottomCollectionCellViewModelProtocol {
    var title: String { get }
    var location: String { get }
    var description: String { get }
    var comments: [Comments] { get }
}

class TourDetailsBottomCollectionCellViewModel: TourDetailsBottomCollectionCellViewModelProtocol {
    var title: String {
        tour.title
    }
    
    var location: String {
        tour.location
    }
    
    var description: String {
        tour.description
    }
    
    var comments: [Comments] {
        tour.comments
    }
    
    private let tour: Tour

    
    
    required init(tour: Tour) {
        self.tour = tour
    }
    
    
}
