//
//  Item.swift
//  EitaCommerceApp
//
//  Created by joao camargo on 28/08/21.
//

import Foundation

struct Item: Codable, Equatable {
    
    enum Category : String, Codable {
        case electronics
        case jewelery
        case menClothing = "men's clothing"
        case womenClothing = "women's clothing"
    }
    
    let id : Int
    let name : String
    let price : Double
    let category : Category
    let description : String
    let imageStringUrl : String
    
    init(id: Int, name: String, price: Double, category: Category, description: String, imageStringUrl: String) {
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
        self.imageStringUrl = imageStringUrl
    }
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name = "title"
        case price
        case category
        case description
        case imageStringUrl = "image"
    }
    
}
