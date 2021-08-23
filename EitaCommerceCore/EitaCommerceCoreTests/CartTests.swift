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
    
    func testCart_RemoveOneIitem_shouldHaveTwoItem(){
        // Arrange
        let sut = Cart(items: [item1,item2,item2])
        
        //Act
        sut.removeItem(item2)

               
        //Assert
        XCTAssertTrue(sut.getItems().first!.isEqual(item1))
        XCTAssertTrue(sut.getItems().last!.isEqual(item1))
        XCTAssertEqual(sut.getItems().count,1)
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
    
    func testCart_AddTwoTimesSameItem_CartShouldHaveOneProductWithQuantityOfTwo(){
        //arrange
        //let sut = Cart(items: [item1,item1])
        let sut = Cart(items: [])
        
        sut.addItem(item1)
        sut.addItem(item1)
        
        //act
        
        for item in sut.getItems() {
            print("ITEMS: \(item.item), \(item.quantity)")
        }
        //assert
        XCTAssertEqual(sut.getItems().count,1)
        XCTAssertEqual(sut.getItems().first!.quantity,2)
    }
    
    func testCart_CartWithSameTwoItens(){
        //arrange
        //let sut = Cart(items: [item1,item1])
        let sut = Cart(items: [item1,item1])

        //act
        
        for item in sut.getItems() {
            print("ITEMS: \(item.item), \(item.quantity)")
        }
        
        //assert
        XCTAssertEqual(sut.getItems().count,1)
        XCTAssertEqual(sut.getItems().first!.quantity,2)
    }
    
    
    
    class CartItem: CartItemProtocol {
              
        let item: String
        var price: Double
        var quantity: Int = 1
        
        internal init(item: String, price: Double, quantity: Int = 1) {
            self.item = item
            self.price = price
            self.quantity = quantity
        }
        
        func isEqual(_ other: CartItemProtocol) -> Bool {
            return item == other.item
        }
        
        func setQuantity(_ quantity: Int) {
            self.quantity = quantity
        }
        
    }
    
}


