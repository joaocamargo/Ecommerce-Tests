//
//  AddICartUseCaseTest.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 24/08/21.
//

import XCTest
@testable import EitaCommerceCore



class  CalculatePriceCartUseCaseTests: XCTestCase {
    
    
    func testRemoveItemUseCase_calculatePrice_ShouldReceivePriceOfTen(){
        let sut = CalculatePriceICartUseCase<CartItem>()
        
        XCTAssertEqual(sut.execute(Cart(items: [CartItem.item1, CartItem.item2])), 20)
    }
    
    func testCalculatePrice_ShouldReceiveTwenty(){

        let sut = CalculatePriceICartUseCase<CartItem>()
               
        
        XCTAssertEqual(sut.execute(Cart(items: [CartItem.item1,CartItem.item2])),20)
    }

    func testCalculatePrice_ForEmptyCart_ShouldReceiveZero(){

        let sut = CalculatePriceICartUseCase<CartItem>()
               
        
        XCTAssertEqual(sut.execute(Cart(items: [CartItem]())),0)
    }


}
