//
//  AddICartUseCaseTest.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 24/08/21.
//

import XCTest
@testable import EitaCommerceCore


class  AddItemCartUseCaseTest: XCTestCase {
    
  
    func testAddItemUseCase_addOneItem_ShouldReceiveCartWithOneItem(){
        //arrange
        let sut = AddItemCartUseCase<CartItem>()
        
        //act
        let cart = sut.execute(CartItem.item1, toCart: Cart(items: [CartItem]()))
        
        //assert
        XCTAssertEqual(cart.items.count, 1)
    }
    
    func testAddItemUseCase_addTwoEqualItem_ShouldReceiveCartWithOneItem(){
        //arrange
        let sut = AddItemCartUseCase<CartItem>()
        
        //act
        var cart = sut.execute(CartItem.item1, toCart: Cart(items: [CartItem]()))
        cart = sut.execute(CartItem.item1, toCart: cart)

        
        //assert
        XCTAssertEqual(cart.items.count, 1)
        XCTAssertEqual(cart.items.first?.quantity, 2)

    }
    
    
    func testAddItemUseCase_addTwoItems_ShouldReceiveCartWithTwoItems(){
        //arrange
        let sut = AddItemCartUseCase<CartItem>()
        
        //act
        var cart = sut.execute(CartItem.item1, toCart: Cart(items: [CartItem]()))
        cart = sut.execute(CartItem.item2, toCart: cart)

        
        //assert
        XCTAssertEqual(cart.items.count, 2)
        XCTAssertEqual(cart.items.first?.quantity, 1)

    }
}
