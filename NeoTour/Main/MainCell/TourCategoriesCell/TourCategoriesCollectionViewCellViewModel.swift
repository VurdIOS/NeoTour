//
//  TourCategoriesCollectionViewCellViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 23.02.2024.
//

import Foundation
protocol TourCategoriesCollectionViewCellViewModelProtocol {
    var title: String { get }
}

class TourCategoriesCollectionViewCellViewModel: TourCategoriesCollectionViewCellViewModelProtocol {
    var title: String {
        categories.title
    }
    
    private let categories: Categories
    
 
    
    required init(categories: Categories) {
        self.categories = categories
    }
}
