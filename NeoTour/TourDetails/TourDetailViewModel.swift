//
//  DetailInfoViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 17.02.2024.
//



//  вернуть фаундешн
import UIKit

protocol TourDetailViewModelProtocol {
//    var tourImage: UIImage { get }
//    var tourName: String { get }
//    var tourLocation: String { get }
//    var tourDescription: String { get }
//    var tourComments: [Comments] { get }
    func getDataForTopCell() -> TourDetailsTopTableViewCellViewModelProtocol
    func getDataForBottomCell() -> TourDetailsBottomCollectionCellViewModelProtocol
    
    init(tour: Tour)
}
class TourDetailViewModel: TourDetailViewModelProtocol {

    private var tour: Tour
//    
//    var tourImage: UIImage {
//        tour.image
//    }
//    
//    var tourName: String {
//        tour.title
//    }
//    
//    var tourLocation: String {
//        tour.location
//    }
//    
//    var tourDescription: String {
//        tour.description
//    }
//    
//    var tourComments: [Comments] {
//        tour.comments
//    }
    
    func getDataForTopCell() -> TourDetailsTopTableViewCellViewModelProtocol {
        TourDetailsTopTableViewCellViewModel(image: tour.image)
    }
    
    func getDataForBottomCell() -> TourDetailsBottomCollectionCellViewModelProtocol {
        TourDetailsBottomCollectionCellViewModel(tour: tour)
    }
    
    
    required init(tour: Tour) {
        self.tour = tour
    }
}
