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

struct tourModel: Hashable {
    var title: String
    var image: UIImage
    var comments: [String]
    var description: String
    
    static func getSomeData() -> tourModel {
        return tourModel(title: "Northern Mountain", image: UIImage(named: "testImage")!, comments: ["Ништяк", "Мне понравилось"],description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut mauris condimentum, imperdiet lorem non, congue felis. Curabitur laoreet, ante ac pretium ultrices, nisi justo cursus metus, vitae sodales dolor.")
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }

    static func == (lhs: tourModel, rhs: tourModel) -> Bool {
      return lhs.identifier == rhs.identifier
    }

    private let identifier = UUID()
  
}
