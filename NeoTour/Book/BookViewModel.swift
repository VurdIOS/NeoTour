//
//  BookViewModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import Foundation

protocol BookViewModelProtocol {
    var peopleCounter: String { get }
    var viewModelDidChange: ((BookViewModelProtocol) -> Void)? { get set }
    func plusButtonTapped()
    func minusButtonTapped()
    
    init(tour: Tour)
}

class BookViewModel: BookViewModelProtocol {
    
    var peopleCounter: String {
        String(counter)
    }
    
    var viewModelDidChange: ((BookViewModelProtocol) -> Void)?
    
    private var tour: Tour!
    
    
    private var counter = 1 {
        didSet {
            viewModelDidChange?(self)
        }
    }
    
    func plusButtonTapped() {
        if counter != 6 { counter += 1}
    }
    
    func minusButtonTapped() {
        if counter != 1 { counter -= 1}
    }
    
    required init(tour: Tour) {
        self.tour = tour
    }
    
}
