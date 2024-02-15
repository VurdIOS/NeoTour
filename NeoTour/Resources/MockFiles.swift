//
//  MockFiles.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 14.02.2024.
//

import UIKit

class MockFiles {
    let mockForCarousel = ["Popular", "Featured", "Most visited", "Europe", "Asia"]
    let mockForGalery = [galeryModel(title: "Northern Mountain", image: UIImage(named: "testImage")!), galeryModel(title: "Northern Mountain", image: UIImage(named: "testImage")!), galeryModel(title: "Northern Mountain", image: UIImage(named: "testImage")!), galeryModel(title: "Northern Mountain", image: UIImage(named: "testImage")!)]
    
    struct galeryModel {
        var title: String
        var image: UIImage
    }
    
    
}
        
       
