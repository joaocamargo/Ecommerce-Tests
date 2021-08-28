//
//  CalculatePriceICartUseCase.swift
//  EitaCommerceCore
//
//  Created by joao camargo on 26/08/21.
//

import Foundation



protocol CalculatePriceICartUseCaseProtocol {
    associatedtype Item: CartItemEquatable
    func execute(_ cart: Cart<Item>) -> Double
}

class CalculatePriceICartUseCase<Item: CartItemEquatable> : CalculatePriceICartUseCaseProtocol {
    func execute(_ cart: Cart<Item>) -> Double {
        return cart.items.map({$0.price}).reduce(0,+)
    }
    
    
}
