//
//  AddICartUseCaseTest.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 24/08/21.
//

import Foundation
import XCTest

import EitaCommerceCore

protocol AddItemCartUseCaseProtocol {
    associatedtype Item: CartItemEquatable
    
    func execute(_ item: CartItemProtocol) -> Cart<Item> {
    
    }
}

class AddItemCartUseCase<item: CartItemEquatable>: AddItemCartUseCaseProtocol {
    func execute(_ item: CartItemEquatable) -> Cart<Item>
}

class  AddICartUseCaseTest: XCTest {
    func testAddItemUseCase_addOnrItem_ShouldReceiveCartWithOneItem(){
        //arrange
        let sut = AddItemCartUseCase()
        
        //act
        let cart = sut.execute(Item())
        
        //assert
        XCTAssertEqual(cart.items.count, 1)
    }
}
