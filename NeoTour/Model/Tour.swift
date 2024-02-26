//
//  3.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 25.02.2024.
//

import UIKit

struct Tour: Hashable {
    var id: Int
    var title: String
    var image: UIImage
    var location: String
    var description: String
    var comments: [Comments]
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }
    
    static func == (lhs: Tour, rhs: Tour) -> Bool {
      return lhs.identifier == rhs.identifier
    }

    private let identifier = UUID()
    
    static func getToursForGalery() -> [Tour] {
        return [Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment())]
    }
    
    static func getToursForRecommended() -> [Tour] {
        return [Tour(id: Int.random(in: 0...5), title: "1Nothern Mountain", image: UIImage(named: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), Tour(id: Int.random(in: 0...5), title: "2Nothern Mountain", image: UIImage(named: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), Tour(id: Int.random(in: 0...5), title: "3Nothern Mountain", image: UIImage(named: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), Tour(id: Int.random(in: 0...5), title: "4Nothern Mountain", image: UIImage(named: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), Tour(id: Int.random(in: 0...5), title: "5Nothern Mountain", image: UIImage(named: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), ]
    }
  
}
