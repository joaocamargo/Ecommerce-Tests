//
//  AddICartUseCaseTest.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 24/08/21.
//

import XCTest
@testable import EitaCommerceCore



class  CalculatePriceCartUseCaseTests: XCTestCase {
    
    let item1 = CartItem(item: Item(name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(name: "Item 3", price: 10))
    
    func testRemoveItemUseCase_calculatePrice_ShouldReceivePriceOfTen(){
        let sut = CalculatePriceICartUseCase<CartItem>()
        
        XCTAssertEqual(sut.execute(Cart(items: [item1, item2])), 20)
    }
    
    func testCalculatePrice_ShouldReceiveTwenty(){

        let sut = CalculatePriceICartUseCase<CartItem>()
               
        
        XCTAssertEqual(sut.execute(Cart(items: [item1,item2])),20)
    }

    func testCalculatePrice_ForEmptyCart_ShouldReceiveZero(){

        let sut = CalculatePriceICartUseCase<CartItem>()
               
        
        XCTAssertEqual(sut.execute(Cart(items: [CartItem]())),0)
    }


}
