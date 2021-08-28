//
//  AddItemCartUseCase.swift
//  EitaCommerceCore
//
//  Created by joao camargo on 26/08/21.
//

import Foundation

protocol AddItemCartUseCaseProtocol {
    associatedtype Item: CartItemEquatable
    func execute(_ item: Item, toCart card: Cart<Item>) -> Cart<Item>
}

class AddItemCartUseCase<Item: CartItemEquatable> : AddItemCartUseCaseProtocol {
    
    func execute(_ item: Item, toCart cart: Cart<Item>) -> Cart<Item> {
        var items : [Item] = cart.items
        
        guard let item = items.first(where: { $0 == item }) else {
            items.append(item)
            return  Cart(items: items)
        }
        
        item.setQuantity(item.quantity + 1)
        
        return  Cart(items: items)
    }
}
