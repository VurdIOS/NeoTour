//
//  3.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 25.02.2024.
//

import UIKit

struct Tour: Hashable, Codable {
    var id: Int
    var title: String
    var image: URL
    var location: String
    var description: String
    var comments: [Comments]
    
    enum CodingKeys: String, CodingKey {
          case id, title, image, location, description, comments
      }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }
    
    static func == (lhs: Tour, rhs: Tour) -> Bool {
      return lhs.identifier == rhs.identifier
    }

    private var identifier = UUID()
  
}
