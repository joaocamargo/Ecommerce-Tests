//
//  AddICartUseCaseTest.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 24/08/21.
//

import XCTest
@testable import EitaCommerceCore



class  RemoveItemCartUseCaseTest: XCTestCase {
    
    let item1 = CartItem(item: Item(name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(name: "Item 3", price: 10))
    
    func testRemoveItemUseCase_removeOneItemShouldReceiveCartWithOneItem(){
        //arrange
        let sut = RemoveItemCartUseCase<CartItem>()
        
        //act
        let cart = sut.execute(item1, toCart: Cart(items: [item1, item2]))
        
        
        //assert
        XCTAssertEqual(cart.items.count, 1)
        XCTAssertEqual(cart.items.first!, item2)
        XCTAssertEqual(cart.items.last!, item2)
    }
    
    func testRemoveItemUseCase_removeOneItemWithQuantityOfTwo_ShouldReceiveCartWithTwoItems(){

        let sut = RemoveItemCartUseCase<CartItem>()
        
        let item = CartItem(item: Item(name: "Item", price: 10))
        item.setQuantity(2)
        
        //var cart = Cart.init(items: [item,item2])
        //cart.removeItem(item)
        
        let cart = sut.execute(item1, toCart: Cart(items: [item, item2]))
    
        
        XCTAssertEqual(cart.items.count, 2)
        XCTAssertEqual(cart.items.first, item)
        XCTAssertEqual(cart.items.last, item2)
    }
    
    func testRemoveItemUseCase_removeOneItemThatNotOnTheCart_ShouldReceiveCartWithTheSameItems(){

        let sut = RemoveItemCartUseCase<CartItem>()
               
        let cart = sut.execute(item3, toCart: Cart(items: [item1, item2]))
    
        
        XCTAssertEqual(cart.items.count, 2)
        XCTAssertEqual(cart.items.first, item1)
        XCTAssertEqual(cart.items.last, item2)
    }
    

}
