//
//  CartTests.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 21/08/21.
//

import XCTest
import EitaCommerceCore

class CartTests: XCTestCase {
    
    let item1 = CartItem(item: "Item 1", price: 10)
    let item2 = CartItem(item: "Item 2", price: 10)
    let item3 = CartItem(item: "Item 3", price: 10)

    func testCart_AddOneIitem_ShouldHaveOneIitem(){
        
        // Arrange
        let sut = Cart(items: [])
        
        //Act
        sut.addItem(item1)
               
        //Assert
        XCTAssertEqual(sut.getItems().count,1)
        XCTAssertTrue(sut.getItems().first!.isEqual(item1))
    }
    
    
    func testCart_AddTwoIitem_ShouldHaveTwoIitem(){
        
        // Arrange
        let sut = Cart(items: [])
        
        //Act
        sut.addItem(item1)
        sut.addItem(item2)
               
        //Assert
        XCTAssertTrue(sut.getItems().first!.isEqual(item1))
        XCTAssertTrue(sut.getItems().last!.isEqual(item2))
        XCTAssertEqual(sut.getItems().count,2)
    }
    
    func testCart_RemoveOneIitem_shouldHaveOneIitem(){
        // Arrange
        let sut = Cart(items: [item1,item2])
        
        //Act
        sut.removeItem(item1)
        
        //Assert
        XCTAssertTrue(sut.getItems().first!.isEqual(item2))
        XCTAssertTrue(sut.getItems().last!.isEqual(item2))
        XCTAssertEqual(sut.getItems().count,1)
    }
    
    func testCart_RemoveOneIitem_shouldHaveTwoIitem(){
        // Arrange
        let sut = Cart(items: [item1,item2,item2])
        
        //Act
        sut.removeItem(item2)

               
        //Assert
        XCTAssertTrue(sut.getItems().first!.isEqual(item1))
        XCTAssertTrue(sut.getItems().last!.isEqual(item2))
        XCTAssertEqual(sut.getItems().count,2)
    }
    
    func testCard_clearAllCart_CartShouldBeEmpty(){
        
        let sut = Cart(items: [item1,item2,item3])
        
        sut.clear()
        
        XCTAssertTrue(sut.getItems().isEmpty)
    }
    
    func testCart_getPrice_ShouldBe10(){
        //arrange
        let sut = Cart(items: [item1])
        
               
        //assert
        XCTAssertEqual(sut.getPrice(),10)
    }
    
    func testCart_getPrice_ShouldBe20(){
        //arrange
        let sut = Cart(items: [item1,item2])
        
               
        //assert
        XCTAssertEqual(sut.getPrice(),20)
    }
    
    
    struct CartItem: CartItemProtocol {
        
        let item: String
        var price: Double

        
        func isEqual(_ other: CartItemProtocol) -> Bool {
            return item == other.item
        }
        
    }
    
}


