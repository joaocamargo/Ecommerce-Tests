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
    
    //MARK: - private properties
    
    private var items: [CartItemProtocol]
    
    //MARK: - public init
    
    public init(items: [CartItemProtocol]) {
        self.items = Cart.addItemOrUpdateQuantity(items)
    }
    
    //MARK: - Public methods
    
    public func getItems() -> [CartItemProtocol] {
        return items
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
    
    //MARK: - Private Items
    
    private static func addItemOrUpdateQuantity(_ items: [CartItemProtocol]) -> [CartItemProtocol] {
        
        //removo todos os items que estão duplicados trazendo os mesmos apenas uma vez
        let uniqueArray = items.filterDuplicates{ $0.isEqual($1) }
        
        //para cada item do array inicial conto quantos vezes ele apareceu e atribuo ao array inicial
        uniqueArray.forEach { item in
            item.setQuantity(items.filter{$0.isEqual(item)}.count)
        }
        
        return uniqueArray
        
        
        // EITA DEV
        //        var filteredItems = [CartItemProtocol]()
        //
        //        items.forEach { item in
        //            let internalFilterItem = items.filter { internalItem in
        //                item.isEqual(internalItem)
        //            }
        //
        //            if !filteredItems.contains(where: { $0.isEqual(item) }) {
        //                item.setQuantity(internalFilterItem.count)
        //                filteredItems.append(item)
        //            }
        //        }
        //
        //        return filteredItems
        
    }
}
