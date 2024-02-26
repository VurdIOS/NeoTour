//
//  TourModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import UIKit

struct ToursData {
    var onboardingImage: UIImage
    var categories: [Categories]
    var toursForGalery: [Tour]
    var toursForReccomended: [Tour]
    
    static func getTourData() -> ToursData {
        return ToursData(onboardingImage: UIImage(named: "testImage")!, categories: Categories.getCategories(), toursForGalery: Tour.getToursForGalery(), toursForReccomended: Tour.getToursForRecommended())
    }
}

