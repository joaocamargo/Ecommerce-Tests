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


public final class Cart<Item: CartItemEquatable> {
    
    //MARK: - private properties
    
    private var items: [Item]
    
    //MARK: - private init
    
    public init(items: [Item]) {
        self.items = items // Cart.start(items)
    }
    
    //MARK: - Public methods
    
    public func getItems() -> [Item] {
        return items
    }
    
       
    public func addItem(_ item: Item) {
        
        guard let item = items.first(where: { $0 == item }) else {
            return items.append(item)
        }
        
        item.setQuantity(item.quantity + 1) 
    }
    
    public func removeItem(_ item: Item) {
               
        guard let itemIndex = items.firstIndex(where: { $0 == item }) else {
            return
        }
        
        let item = items[itemIndex]
        
        if item.quantity > 1 {
            item.setQuantity(item.quantity - 1)
        } else {
            items.remove(at: itemIndex)
        }
        
    }
    
    public func clear() {
        items.removeAll()
    }
    
    public func getPrice() -> Double {
        return items.map({$0.price}).reduce(0,+)
    }
    
    //MARK: - Private Items
    
    public static func start(items: [Item]) -> Cart {
        //removo todos os items que estão duplicados trazendo os mesmos apenas uma vez
        let uniqueArray = items.filterDuplicates{ $0 == $1  }

        //para cada item do array inicial conto quantos vezes ele apareceu e atribuo ao array inicial
        uniqueArray.forEach { item in
            item.setQuantity(items.filter{$0 == item }.count)
        }

        return Cart(items: uniqueArray)
        
        
        //teste
        //let iii = Array(Set(items.map({$0.item.id})))
        
        // EITA DEV
//                var filteredItems = [Item]()
//
//                items.forEach { item in
//                    let internalFilterItem = items.filter{ $0 == item }
//
//                    if !filteredItems.contains(where: { $0 == item }) {
//                        item.setQuantity(internalFilterItem.count)
//                        filteredItems.append(item)
//                    }
//                }
//
//        return Cart(items: filteredItems)
        
    }
}
