//
//  MainModelView.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 15.02.2024.
//

import Foundation

protocol MainViewModelProtocol {
    var categories: [Categories] { get }
    var toursForGalery: [Tour] { get }
    var toursForRecommended: [Tour] { get }
    func getDataForCategoriesCell(categories: Categories) -> TourCategoriesCollectionViewCellViewModelProtocol
    func getDataForGaleryCell(tour: Tour) -> GaleryCollectionViewCellViewModelProtocol
    func getDataForRecommendedCell(tour: Tour) -> RecommendedCollectionViewCellViewModelProtocol
    func getDataForDetailView(tour: Tour) -> TourDetailViewModelProtocol
    func changeCategory(id: Int)
}

class MainViewModel: MainViewModelProtocol {
    var categories: [Categories] {
        tours.categories
    }
    var toursForGalery: [Tour] {
            filteredToursForGalery ?? tours.toursForGalery
    }
    
    var toursForRecommended: [Tour] {
        tours.toursForReccomended
    }
    
    private var filteredToursForGalery: [Tour]?
    
    func getDataForCategoriesCell(categories: Categories) -> TourCategoriesCollectionViewCellViewModelProtocol {
        TourCategoriesCollectionViewCellViewModel(categories: categories)
    }
    
    func getDataForGaleryCell(tour: Tour) -> GaleryCollectionViewCellViewModelProtocol {
        GaleryCollectionViewCellViewModel(tour: tour)
    }
    
    func getDataForRecommendedCell(tour: Tour) -> RecommendedCollectionViewCellViewModelProtocol {
        RecommendedCollectionViewCellViewModel(tour: tour)
    }
    func getDataForDetailView(tour: Tour) -> TourDetailViewModelProtocol {
        TourDetailViewModel(tour: tour)
    }
    
    func changeCategory(id: Int) {
        filteredToursForGalery = tours.toursForGalery.filter { $0.id == id }
       }
    
    
    private let tours: ToursData
    
    required init(tours: ToursData) {
        self.tours = tours
    }
}
