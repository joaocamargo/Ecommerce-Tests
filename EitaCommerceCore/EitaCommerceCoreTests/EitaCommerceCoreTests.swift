//
//  EitaCommerceCoreTests.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 28/08/21.
//

import XCTest
@testable import EitaCommerceCore




class EitaCommerceCoreTests: XCTestCase {
    
    
    let item =  CartItem(item: Item(name: "Item 1", price: 10.0))
    
    func testEitaCommerceCore_start_ShouldReturnValidEitaCommerceCore(){
        //arrange
        let sut = EitaCommerceCore.startWith(items: [CartItem]())
        
        XCTAssertNotNil(sut)
        
    }
    
    func testEitaCommerceCore_StartWithItems_ShouldReturnEitaCommerceCoreWithPopulatedCardWithItems(){
        let sut = EitaCommerceCore.startWith(items: [item])
            
        XCTAssertEqual(sut.currentCart.items.count, 1)
        XCTAssertEqual(sut.currentCart.items , [item])

    }
    
    func testEitaCommerceCore_addItem_ShouldReturnCartWithItem(){
        //arrange
        let sut = EitaCommerceCore.startWith(items: [CartItem]())
        
        //act
        let cart = sut.add(item: item)
        
        //assert
        XCTAssertEqual(cart.items.count, 1)
        XCTAssertEqual(cart.items, [item])

        XCTAssertEqual(sut.currentCart.items.count, 1)
        XCTAssertEqual(sut.currentCart.items , [item])
    }
    
    func testEitaCommerceCore_removeItem_ShouldReturnCartWithoutItem(){
        //arrange
        let sut = EitaCommerceCore.startWith(items: [CartItem]())
        
        //act
        let cart = sut.remove(item: item)
        
        //assert
        XCTAssertEqual(cart.items.count, 0)
        XCTAssertEqual(cart.items, [])

        XCTAssertEqual(sut.currentCart.items.count, 0)
        XCTAssertEqual(sut.currentCart.items , [])
    }
    
    func testEitaCommerceCore_clearItem_ShouldReturnCartWithoutItem(){
        //arrange
        let sut = EitaCommerceCore.startWith(items: [CartItem]())
        
        //act
        let cart = sut.clear()
        
        //assert
        XCTAssertEqual(cart.items.count, 0)
        XCTAssertEqual(cart.items, [])

        XCTAssertEqual(sut.currentCart.items.count, 0)
        XCTAssertEqual(sut.currentCart.items , [])
    }
    
    
    func testeEitaCommerceCore_calculateTotalPrice_ShouldReturnCartTotalPrice() {
        let sut = EitaCommerceCore.startWith(items: [item])
        
        let price  = sut.calculateTotalPrice()
        
        XCTAssertEqual(price, 10)
    }
}
