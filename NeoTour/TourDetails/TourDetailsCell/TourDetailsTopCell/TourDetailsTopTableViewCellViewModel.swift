//
//  TourDetailsTopTableViewCellViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 23.02.2024.
//

import UIKit
#warning("Убрать юайкит и присвоить картинке тип дата")
protocol TourDetailsTopTableViewCellViewModelProtocol {
    var image: UIImage { get }
}

class TourDetailsTopTableViewCellViewModel: TourDetailsTopTableViewCellViewModelProtocol {
    var image: UIImage
    
    required init(image: UIImage) {
        self.image = image
    }
    
    
}
