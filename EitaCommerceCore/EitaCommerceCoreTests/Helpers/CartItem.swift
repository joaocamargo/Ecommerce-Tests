//
//  MockCartItem.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 24/08/21.
//

import Foundation
import EitaCommerceCore

class CartItem: CartItemEquatable {
    
    static var item1: CartItem { CartItem(item: Item(id: 1,name: "Item 1", price: 10)) }
    static var item2: CartItem { CartItem(item: Item(id: 2,name: "Item 2", price: 10)) }
    static var item3: CartItem { CartItem(item: Item(id: 3,name: "Item 3", price: 10)) }

    let item: ItemProtocol
    var price: Double {
        return item.price * Double(quantity)
    }
    
    var quantity: Int = 1
    
    internal init(item: ItemProtocol) {
        self.item = item
    }
    
   // func isEqual(_ other: CartItemProtocol) -> Bool {
   //     return item.id == other.item.id
   // }
    
    func setQuantity(_ quantity: Int) {
        self.quantity = quantity
    }
    
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        lhs.item.id == rhs.item.id
    }
    
}
