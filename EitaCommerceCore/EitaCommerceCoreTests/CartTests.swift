//
//  CartTests.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 21/08/21.
//

import XCTest

class Cart {
    
    private(set) var items = [String]()
    
    func addProduct(_ product: String) {
        items.append(product)
    }
    
    func removeProduct(_ product: String) {
        
    }
    
    
}

class CartTests: XCTestCase {

    func testCart_AddOneProduct_ShouldHaveOneProduct(){
        
        // Arrange
        let sut = Cart()
        
        //Act
        sut.addProduct("product 1")
               
        //Assert
        XCTAssertEqual(sut.items.count,1)
        XCTAssertEqual(sut.items.first,"product 1")
    }
    
    
    func testCart_AddTwoProduct_ShouldHaveTwoProduct(){
        
        // Arrange
        let sut = Cart()
        
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
        let sut = Cart()
        
        //Act
        sut.addProduct("product 1")
        sut.addProduct("product 2")
        sut.removeProduct("product 1")

               
        //Assert
        XCTAssertEqual(sut.items.first,"product 1")
        XCTAssertEqual(sut.items.last,"product 2")
        XCTAssertEqual(sut.items.count,2)
    }
}
