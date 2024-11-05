//
//  Product.swift
//  Aug_24_iOS_JSONDecoder_Demo
//
//  Created by Vishal Jagtap on 05/11/24.
//

import Foundation

//json serialization using decodable protocol

struct Product : Decodable{
    var id : Int
    var title : String
    var price : Double
    var description : String
    var category : String
    var image : String
    var rate : Double
    var count : Int
    
    enum ProductKeys : String, CodingKey{
        case id
        case title
        case price
        case description
        case cat = "category"
        case image
        case rating
    }
    
    enum RatingKeys : CodingKey{
        case rate
        case count
    }
    
    init(from decoder: any Decoder) throws {
        
        let mainContainer = try! decoder.container(keyedBy: ProductKeys.self)
        id = try! mainContainer.decode(Int.self, forKey: .id)
        title = try! mainContainer.decode(String.self, forKey: .title)
        price = try! mainContainer.decode(Double.self, forKey: .price)
        description = try! mainContainer.decode(String.self, forKey: .description)
        category = try! mainContainer.decode(String.self, forKey: .cat)
        image = try! mainContainer.decode(String.self, forKey: .image)
        
        let nestedContainer = try! mainContainer.nestedContainer(keyedBy: RatingKeys.self, forKey: .rating)
        rate = try! nestedContainer.decode(Double.self, forKey: .rate)
        count = try! nestedContainer.decode(Int.self, forKey: .count)
    }
}
