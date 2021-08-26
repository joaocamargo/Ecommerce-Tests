//
//  MockCartItem.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 24/08/21.
//

import Foundation
import EitaCommerceCore

class CartItem: CartItemEquatable {

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
