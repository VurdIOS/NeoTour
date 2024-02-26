//
//  DetailInfoViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 17.02.2024.
//



//  вернуть фаундешн
import UIKit

protocol TourDetailViewModelProtocol {
    func getDataForTopCell() -> TourDetailsTopTableViewCellViewModelProtocol
    func getDataForBottomCell() -> TourDetailsBottomCollectionCellViewModelProtocol
    func getDataForBookView() -> BookViewModelProtocol
    
    init(tour: Tour)
}
class TourDetailViewModel: TourDetailViewModelProtocol {

    private var tour: Tour
    
    func getDataForTopCell() -> TourDetailsTopTableViewCellViewModelProtocol {
        TourDetailsTopTableViewCellViewModel(image: UIImage())
    }
    
    func getDataForBottomCell() -> TourDetailsBottomCollectionCellViewModelProtocol {
        TourDetailsBottomCollectionCellViewModel(tour: tour)
    }
    func getDataForBookView() -> BookViewModelProtocol {
        BookViewModel(tour: tour)
    }
    
    
    required init(tour: Tour) {
        self.tour = tour
    }
}
