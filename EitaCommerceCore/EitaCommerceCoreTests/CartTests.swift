//
//  CartTests.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 21/08/21.
//

import XCTest
import EitaCommerceCore

class CartTests: XCTestCase {
    
    let item1 = CartItem(item: Item(name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(name: "Item 3", price: 10))


           
    func testCard_clearAllCart_CartShouldBeEmpty(){
        
        let sut = Cart.start(items: [item1,item2,item3])
        
        sut.clear()
        
        XCTAssertTrue(sut.getItems().isEmpty)
    }
    
    func testCart_getPrice_ShouldBe10(){
        //arrange
        let sut = Cart.start(items: [item1])
        
               
        //assert
        XCTAssertEqual(sut.getPrice(),10)
    }
    
    func testCart_getPrice_ShouldBe20(){
        //arrange
        let sut = Cart.start(items: [item1,item2])
        
               
        //assert
        XCTAssertEqual(sut.getPrice(),20)
    }
    
    
    func testCart_CartWithSameTwoItens_CartShouldBeOneItemWithQuantityOfTwo(){
        //arrange
        //let sut = Cart.start(items: [item1,item1])
        let sut = Cart.start(items: [item1,item1])

        //act
        
        for item in sut.getItems() {
            print("ITEMS: \(item.item), \(item.quantity)")
        }
        
        //assert
        XCTAssertEqual(sut.getItems().count,1)
        XCTAssertEqual(sut.getItems().first!.quantity,2)
    }
    
    
    
    
}


