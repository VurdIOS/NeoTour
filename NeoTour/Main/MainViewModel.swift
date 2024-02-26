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
}

class MainViewModel: MainViewModelProtocol {
    
    var categories: [Categories] {
        tours.categories
    }
    var toursForGalery: [Tour] {
        tours.toursForGalery
    }
    
    var toursForRecommended: [Tour] {
        tours.toursForReccomended
    }
    
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
    
    lazy var toursss = tours.toursForReccomended
    
    func loadImage() {
        for imageUrl in toursss {
            NetworkLayer.fetchImage(from: imageUrl.image) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let image):
                        print("sdsdfsdf")
//                        self?.onDataLoaded?(image)
                    case .failure(let error):
                        print(error) // Обработка ошибки
//                        self?.onDataLoaded?(nil)
                    }
                }
            }
        }
        // Предполагаем, что у тебя есть метод для загрузки картинки по URL

    }
    
    
    private let tours: ToursData
    
    required init(tours: ToursData) {
        self.tours = tours
    }
}
