//
//  5.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 25.02.2024.
//

import Foundation

struct Categories: Hashable {
    var id: Int
    var title: String
    
    static func getCategories() -> [Categories] {
        return [Categories(id: 0, title: "Popular"), Categories(id: 1, title: "Featured"), Categories(id: 2, title: "Most visited"), Categories(id: 3, title: "Europe"), Categories(id: 4, title: "Asia")]
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }
    
    static func == (lhs: Categories, rhs: Categories) -> Bool {
      return lhs.identifier == rhs.identifier
    }

    private let identifier = UUID()
}
