//
//  RemoveCartUseCase.swift
//  EitaCommerceCore
//
//  Created by joao camargo on 26/08/21.
//

import Foundation

protocol RemoveItemCartUseCaseProtocol {
    associatedtype Item: CartItemEquatable
    func execute(_ item: Item, toCart card: Cart<Item>) -> Cart<Item>
}

class RemoveItemCartUseCase<Item: CartItemEquatable> : RemoveItemCartUseCaseProtocol {
    
    func execute(_ item: Item, toCart cart: Cart<Item>) -> Cart<Item> {
        
        var items = cart.items
        
        guard let itemIndex = items.firstIndex(where: { $0 == item }) else {
            return cart
        }
        
        let item = items[itemIndex]
        
        if item.quantity > 1 {
            item.setQuantity(item.quantity - 1)
        } else {
            items.remove(at: itemIndex)
        }
        return Cart(items: items)
    }
}
