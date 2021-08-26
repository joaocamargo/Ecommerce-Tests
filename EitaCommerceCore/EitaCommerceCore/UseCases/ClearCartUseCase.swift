//
//  ClearCartUseCase.swift
//  EitaCommerceCore
//
//  Created by joao camargo on 26/08/21.
//

import Foundation

protocol ClearCartUseCaseProtocol {
    associatedtype Item: CartItemEquatable
    func execute() -> Cart<Item>
}

class ClearCartUseCase<Item: CartItemEquatable> : ClearCartUseCaseProtocol {
    func execute() -> Cart<Item> {
        return Cart(items: [Item]())
    }
    
    
}
