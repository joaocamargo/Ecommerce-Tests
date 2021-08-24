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

    func testCart_AddOneIitem_ShouldHaveOneIitem(){
        
        // Arrange
        let sut = Cart.start(items: [CartItem]())
        
        //Act
        sut.addItem(item1)
               
        //Assert
        XCTAssertEqual(sut.getItems().count,1)
        XCTAssertEqual(sut.getItems().first,item1)
    }
    
    
    func testCart_AddTwoIitem_ShouldHaveTwoIitem(){
        
        // Arrange
        let sut = Cart.start(items:  [CartItem]())
        
        //Act
        sut.addItem(item1)
        sut.addItem(item2)
               
        //Assert
        XCTAssertEqual(sut.getItems().first,item1)
        XCTAssertEqual(sut.getItems().last,item2)
        XCTAssertEqual(sut.getItems().count,2)
    }
    
    func testCart_RemoveOneIitem_shouldHaveOneIitem(){
        // Arrange
        let sut = Cart.start(items: [item1,item2])
        
        //Act
        sut.removeItem(item1)
        
        //Assert
        XCTAssertEqual(sut.getItems().first,item2)
        XCTAssertEqual(sut.getItems().last,item2)
        XCTAssertEqual(sut.getItems().count,1)
    }
    
    func testCart_RemoveOneIitem_shouldHaveTwoItem(){
        // Arrange
        let sut = Cart.start(items: [item1,item2,item2])
        
        //Act
        sut.removeItem(item2)

               
        //Assert
        XCTAssertEqual(sut.getItems().first,item1)
        XCTAssertEqual(sut.getItems().last,item2)
        XCTAssertEqual(sut.getItems().count,2)
    }
    
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
    
    func testCart_AddTwoTimesSameItem_CartShouldHaveOneProductWithQuantityOfTwo(){
        //arrange
        //let sut = Cart.start(items: [item1,item1])
        let sut = Cart.start(items: [CartItem]())
        
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
    
    
    //MARK: - Helper
    
    struct Item: ItemProtocol {
        var id = UUID()
        var name: String
        var price: Double
        
        
    }
    
    class CartItem: CartItemEquatable {

        let item: ItemProtocol
        var price: Double {
            return item.price * Double(quantity)
        }
        
        var quantity: Int = 1
        
        internal init(item: ItemProtocol) {
            self.item = item
        }
        
       // func isEqual(_ other: CartItemProtocol) -> Bool {
       //     return item.id == other.item.id
       // }
        
        func setQuantity(_ quantity: Int) {
            self.quantity = quantity
        }
        
        static func == (lhs: CartTests.CartItem, rhs: CartTests.CartItem) -> Bool {
            lhs.item.id == rhs.item.id
        }
        
    }
    
}


