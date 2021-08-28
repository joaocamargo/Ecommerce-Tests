//
//  ExtensionTestCase.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 26/08/21.
//

import XCTest
@testable import EitaCommerceCore


class ExtensionTestCase: XCTestCase {
    
    let item1 = CartItem(item: Item(id: 1,name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(id: 2,name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(id: 3,name: "Item 3", price: 10))

    
    func testExtensionRemoveDuplicates_AddThreeDifferent_ShouldReturnThreeItemsOnly(){
        
        var cart = Cart(items: [item1,item2,item2,item3,item2,item3])
        
        let filterItems = cart.items.filterDuplicates{ $0 == $1 }
        
        XCTAssertEqual(filterItems.count,3)
        
    }
    

}
