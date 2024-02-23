//
//  OnboardingViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 13.02.2024.
//
#warning("Убрать юайкит и присвоить картинке тип дата")
import UIKit
protocol OnboardinViewModelProtocol {
    var image: UIImage { get }
    func getDataForMainView() -> MainViewModelProtocol
}

class OnboardingViewModel : OnboardinViewModelProtocol {
    
    
    var image: UIImage {
        tourData.onboardingImage
    }
    
    private let tourData = TourModel.getTourData()
    
    func getDataForMainView() -> MainViewModelProtocol {
        MainViewModel(tours: tourData)
    }
}
