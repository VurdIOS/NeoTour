//
//  TourModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import UIKit

struct ToursData: Codable {
    var onboardingImage: String
    var categories: [Categories]
    var toursForGalery: [Tour]
    var toursForReccomended: [Tour]
}
