//
//  Cart.swift
//  EitaCommerceCore
//
//  Created by joao camargo on 22/08/21.
//

import Foundation



public protocol ItemProtocol {
    var id: UUID { get }
    var name: String { get }
    var price: Double { get }
}


public protocol CartItemProtocol {
    var item: ItemProtocol { get }
    var price: Double { get }
    var quantity: Int { get }    
    
    func setQuantity(_ quantity: Int)
    //func isEqual(_ other: CartItemProtocol) -> Bool
}

public typealias CartItemEquatable = (CartItemProtocol & Equatable)


public struct Cart<Item: CartItemEquatable> {
    
    //MARK: - private properties
    
    let items: [Item]
   
}
