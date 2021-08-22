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
    
    func addProduct(_ product: String) {
        items.append(product)
    }
    
    func removeProduct(_ product: String) {
        
        let index = items.firstIndex(where: { $0 == product }) // OR  items.firstIndex(of: product)
        
        if let index = index {
            items.remove(at: index)
        }
    }
    
    func clear() {
        items.removeAll()
    }
    
    
}

class CartTests: XCTestCase {

    func testCart_AddOneProduct_ShouldHaveOneProduct(){
        
        // Arrange
        let sut = Cart(items: [])
        
        //Act
        sut.addProduct("product 1")
               
        //Assert
        XCTAssertEqual(sut.items.count,1)
        XCTAssertEqual(sut.items.first,"product 1")
    }
    
    
    func testCart_AddTwoProduct_ShouldHaveTwoProduct(){
        
        // Arrange
        let sut = Cart(items: [])
        
        //Act
        sut.addProduct("product 1")
        sut.addProduct("product 2")

               
        //Assert
        XCTAssertEqual(sut.items.first,"product 1")
        XCTAssertEqual(sut.items.last,"product 2")
        XCTAssertEqual(sut.items.count,2)
    }
    
    func testCart_RemoveOneProduct_shouldHaveOneProduct(){
        // Arrange
        let sut = Cart(items: [])
        
        //Act
        sut.addProduct("product 1")
        sut.addProduct("product 2")
        sut.removeProduct("product 1")

               
        //Assert
        XCTAssertEqual(sut.items.first,"product 2")
        XCTAssertEqual(sut.items.last,"product 2")
        XCTAssertEqual(sut.items.count,1)
    }
    
    func testCart_RemoveOneProduct_shouldHaveTwoProduct(){
        // Arrange
        let sut = Cart(items: [])
        
        //Act
        sut.addProduct("product 1")
        sut.addProduct("product 2")
        sut.addProduct("product 2")
        sut.removeProduct("product 2")

               
        //Assert
        XCTAssertEqual(sut.items.first,"product 1")
        XCTAssertEqual(sut.items.last,"product 2")
        XCTAssertEqual(sut.items.count,2)
    }
    
    func testCard_clearAllCart_CartShouldBeEmpty(){
        let sut = Cart()
        
        sut.addProduct("product 1")
        sut.addProduct("product 2")
        sut.addProduct("product 2")
        
        sut.clear()
        
        XCTAssertTrue(sut.items.isEmpty)
    }
    
}
