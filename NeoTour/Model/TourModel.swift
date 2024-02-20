//
//  TourModel.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 20.02.2024.
//

import UIKit

struct TourData {
    var onboardingImage: UIImage
    var categories: [Categories]
    var toursForGalery: [TourModel]
    var toursForReccomended: [TourModel]
    
    static func getTourData() -> TourData {
        return TourData(onboardingImage: UIImage(named: "testImage")!, categories: Categories.getCategories(), toursForGalery: TourModel.getToursForGalery(), toursForReccomended: TourModel.getToursForRecommended())
    }
}

struct TourModel: Hashable {
    var id: Int
    var title: String
    var image: UIImage
    var description: String
    var comments: [Comments]
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }
    
    static func == (lhs: TourModel, rhs: TourModel) -> Bool {
      return lhs.identifier == rhs.identifier
    }

    private let identifier = UUID()
    
    static func getToursForGalery() -> [TourModel] {
        return [TourModel(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), TourModel(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), TourModel(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), TourModel(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment())]
    }
    
    static func getToursForRecommended() -> [TourModel] {
        return [TourModel(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), TourModel(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), TourModel(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), TourModel(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), TourModel(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), TourModel(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), TourModel(id: Int.random(in: 0...5), title: "Nothern Mountain", image: UIImage(named: "testImage")!, description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comments.getComment()), ]
    }
  
}

struct Comments {
    var image: UIImage
    var author: String
    var content: String
    
    static func getComment() -> [Comments] {
        return [Comments(image: UIImage(named: "userImage")!, author: "Tom", content: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa"), Comments(image: UIImage(named: "userImage")!, author: "Tom", content: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa"), Comments(image: UIImage(named: "userImage")!, author: "Tom", content: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa"), Comments(image: UIImage(named: "userImage")!, author: "Tom", content: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa"), Comments(image: UIImage(named: "userImage")!, author: "Tom", content: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa")]
    }
}

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


