//
//  AddICartUseCaseTest.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 24/08/21.
//

import XCTest
@testable import EitaCommerceCore




class  ClearCartUseCaseTest: XCTestCase {
    
    let item1 = CartItem(item: Item(name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(name: "Item 3", price: 10))
    
    
    func testAddItemUseCase_clearCart_ShouldReceiveAnEmptyCart(){
        //arrange
        let sut = ClearCartUseCase<CartItem>()
        
        //act
        //let cart = sut.execute(toCart: Cart(items: [item1,item2, item3]))
        
        //assert
        XCTAssertTrue(sut.execute().items.isEmpty)
    }

}
