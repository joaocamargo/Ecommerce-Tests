//
//  AddICartUseCaseTest.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 24/08/21.
//

import XCTest
@testable import EitaCommerceCore



class  RemoveItemCartUseCaseTest: XCTestCase {
    
   
    func testRemoveItemUseCase_removeOneItemShouldReceiveCartWithOneItem(){
        //arrange
        let sut = RemoveItemCartUseCase<CartItem>()
        
        //act
        let cart = sut.execute(CartItem.item1, toCart: Cart(items: [CartItem.item1, CartItem.item2]))
        
        
        //assert
        XCTAssertEqual(cart.items.count, 1)
        XCTAssertEqual(cart.items.first!, CartItem.item2)
        XCTAssertEqual(cart.items.last!, CartItem.item2)
    }
    
    func testRemoveItemUseCase_removeOneItemWithQuantityOfTwo_ShouldReceiveCartWithTwoItems(){

        let sut = RemoveItemCartUseCase<CartItem>()
        
        let item = CartItem(item: Item(id:1, name: "Item", price: 10))
        item.setQuantity(2)
        
        //var cart = Cart.init(items: [item,item2])
        //cart.removeItem(item)
        
        let cart = sut.execute(CartItem.item1, toCart: Cart(items: [item, CartItem.item2]))
    
        
        XCTAssertEqual(cart.items.count, 2)
        XCTAssertEqual(cart.items.first, item)
        XCTAssertEqual(cart.items.last, CartItem.item2)
    }
    
    func testRemoveItemUseCase_removeOneItemThatNotOnTheCart_ShouldReceiveCartWithTheSameItems(){

        let sut = RemoveItemCartUseCase<CartItem>()
               
        let cart = sut.execute(CartItem.item3, toCart: Cart(items: [CartItem.item1, CartItem.item2]))
    
        
        XCTAssertEqual(cart.items.count, 2)
        XCTAssertEqual(cart.items.first, CartItem.item1)
        XCTAssertEqual(cart.items.last, CartItem.item2)
    }
    

}
