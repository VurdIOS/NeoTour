//
//  OnboardingViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 13.02.2024.
//
import UIKit
protocol OnboardinViewModelProtocol {
    var onDataLoaded: ((UIImage?) -> Void)? { get set }
    func getDataForMainView() -> MainViewModelProtocol
    func loadData()
    func loadImage(from: URL)
}

class OnboardingViewModel : OnboardinViewModelProtocol {
    
    var onDataLoaded: ((UIImage?) -> Void)?
    
    private var tourData: ToursData! 
    
    func getDataForMainView() -> MainViewModelProtocol {
        MainViewModel(tours: tourData)
    }
    
    func loadData() {
        // Загружаем общую модель данных
        NetworkLayer.shared.fetchTour { [weak self] result in
            switch result {
            case .success(let dataModel):
                // Извлекаем URL картинки из модели
                let imageUrl = dataModel.onboardingImage
                self?.tourData = dataModel
                // Загружаем картинку
                self?.loadImage(from: imageUrl)
            case .failure(let error):
                print(error) // Обработка ошибки
                self?.onDataLoaded?(nil)
            }
        }
    }
    
    func loadImage(from url: URL) {
        // Предполагаем, что у тебя есть метод для загрузки картинки по URL
        NetworkLayer.fetchImage(from: url) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    print("sdsdfsdf")
                    self?.onDataLoaded?(image)
                case .failure(let error):
                    print(error) // Обработка ошибки
                    self?.onDataLoaded?(nil)
                }
            }
        }
    }


}
