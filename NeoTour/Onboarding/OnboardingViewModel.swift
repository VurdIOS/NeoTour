//
//  OnboardingViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 13.02.2024.
//

import UIKit

protocol OnboardinViewModelProtocol {
    var onDataLoaded: ((Data?) -> Void)? { get set }
    func getDataForMainView() -> MainViewModelProtocol
    func loadData()
    func loadImage(from: String)
}

class OnboardingViewModel : OnboardinViewModelProtocol {
    var onDataLoaded: ((Data?) -> Void)?
    private var tourData: ToursData!
    
    func getDataForMainView() -> MainViewModelProtocol {
        MainViewModel(tours: tourData)
    }
    func loadData() {
        NetworkLayer.shared.fetchTour { [weak self] result in
            switch result {
            case .success(let dataModel):
                let imageUrl = dataModel.onboardingImage
                self?.tourData = dataModel
                self?.loadImage(from: imageUrl)
            case .failure(_):
                self?.onDataLoaded?(nil)
            }
        }
    }
    
    func loadImage(from url: String) {
        NetworkLayer.shared.fetchImage(from: url) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self?.onDataLoaded?(image)
                case .failure(_):
                    self?.onDataLoaded?(nil)
                }
            }
        }
    }


}
