//
//  BookViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import Foundation

protocol BookViewModelProtocol {
    init(tour: Tour)
}

class BookViewModel: BookViewModelProtocol {
    
    private var tour: Tour!
    
    required init(tour: Tour) {
        self.tour = tour
    }
}
