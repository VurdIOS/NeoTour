//
//  OnboardingModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 13.02.2024.
//

import UIKit

struct Onboarding: Decodable {
    var image: Data
}

struct galeryModel {
    var title: String
    var image: UIImage
    var comments: [String]
    var description: String
    
    static func getSomeData() -> galeryModel {
        return galeryModel(title: "Northern Mountain", image: UIImage(named: "testImage")!, comments: ["Ништяк", "Мне понравилось"],description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut mauris condimentum, imperdiet lorem non, congue felis. Curabitur laoreet, ante ac pretium ultrices, nisi justo cursus metus, vitae sodales dolor.")
    }
}
