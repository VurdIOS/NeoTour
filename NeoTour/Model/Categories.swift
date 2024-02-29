//
//  5.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 25.02.2024.
//

import Foundation

struct Categories: Hashable, Codable {
    var id: Int
    var title: String
    
    enum CodingKeys: String, CodingKey {
         case id, title
     }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }
    
    static func == (lhs: Categories, rhs: Categories) -> Bool {
      return lhs.identifier == rhs.identifier
    }

    private var identifier = UUID()
}
