//
//  4.swift
//  NeoTour
//
//  Created by Камаль Атавалиев on 25.02.2024.
//

import UIKit

struct Comments {
    var image: UIImage
    var author: String
    var content: String
    
    static func getComment() -> [Comments] {
        return [Comments(image: UIImage(named: "userImage")!, author: "Tom", content: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa"), Comments(image: UIImage(named: "userImage")!, author: "Tom", content: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa")]
    }
}
