//
//  Cart.swift
//  EitaCommerceCore
//
//  Created by joao camargo on 22/08/21.
//

import Foundation


public protocol CartItemProtocol {
    var item: String { get }
    var price: Double { get }
    var quantity: Int { get }    
    
    //func getPrice() -> Double
    func setQuantity(_ quantity: Int)
    func isEqual(_ other: CartItemProtocol) -> Bool
}


public final class Cart {
    
    private var items: [CartItemProtocol]
    
    public func getItems() -> [CartItemProtocol] {
        return items
    }
    
    
    public init(items: [CartItemProtocol]) {
        self.items = items
    }
    
    public func addItem(_ item: CartItemProtocol) {
        
        guard let item = items.first(where: { $0.isEqual(item) }) else {
            return items.append(item)
        }
        
        item.setQuantity(item.quantity + 1) 
    }
    
    public func removeItem(_ item: CartItemProtocol) {
        
        let index = items.firstIndex(where: { $0.isEqual(item) }) // OR  items.firstIndex(of: Iitem)
        
        if let index = index {
            items.remove(at: index)
        }
    }
    
    public func clear() {
        items.removeAll()
    }
    
    public func getPrice() -> Double {
        return items.map({$0.price}).reduce(0,+)
    }
    
    
    
}
