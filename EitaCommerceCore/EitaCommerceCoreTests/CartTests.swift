//
//  CartTests.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 21/08/21.
//

import XCTest

class Cart {
    
    private(set) var items: [String]
    
   
    init(items: [String]) {
        self.items = items
    }
    
    func addItem(_ item: String) {
        items.append(item)
    }
    
    func removeItem(_ item: String) {
        
        let index = items.firstIndex(where: { $0 == item }) // OR  items.firstIndex(of: Iitem)
        
        if let index = index {
            items.remove(at: index)
        }
    }
    
    func clear() {
        items.removeAll()
    }
    
    
}

class CartTests: XCTestCase {
    
    let item1 = "Item 1"
    let item2 = "Item 2"
    let item3 = "Item 3"

    func testCart_AddOneIitem_ShouldHaveOneIitem(){
        
        // Arrange
        let sut = Cart(items: [])
        
        //Act
        sut.addItem(item1)
               
        //Assert
        XCTAssertEqual(sut.items.count,1)
        XCTAssertEqual(sut.items.first,item1)
    }
    
    
    func testCart_AddTwoIitem_ShouldHaveTwoIitem(){
        
        // Arrange
        let sut = Cart(items: [])
        
        //Act
        sut.addItem(item1)
        sut.addItem(item2)
               
        //Assert
        XCTAssertEqual(sut.items.first,item1)
        XCTAssertEqual(sut.items.last,item2)
        XCTAssertEqual(sut.items.count,2)
    }
    
    func testCart_RemoveOneIitem_shouldHaveOneIitem(){
        // Arrange
        let sut = Cart(items: [item1,item2])
        
        //Act
        sut.removeItem(item1)
        
        //Assert
        XCTAssertEqual(sut.items.first,item2)
        XCTAssertEqual(sut.items.last,item2)
        XCTAssertEqual(sut.items.count,1)
    }
    
    func testCart_RemoveOneIitem_shouldHaveTwoIitem(){
        // Arrange
        let sut = Cart(items: [item1,item2,item2])
        
        //Act
        sut.removeItem(item2)

               
        //Assert
        XCTAssertEqual(sut.items.first,item1)
        XCTAssertEqual(sut.items.last,item2)
        XCTAssertEqual(sut.items.count,2)
    }
    
    func testCard_clearAllCart_CartShouldBeEmpty(){
        
        let sut = Cart(items: [item1,item2,item3])
        
        sut.clear()
        
        XCTAssertTrue(sut.items.isEmpty)
    }
    
}
