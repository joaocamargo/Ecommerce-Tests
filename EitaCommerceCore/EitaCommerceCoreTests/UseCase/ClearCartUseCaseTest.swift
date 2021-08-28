//
//  AddICartUseCaseTest.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 24/08/21.
//

import XCTest
@testable import EitaCommerceCore




class  ClearCartUseCaseTest: XCTestCase {
    
 
    
    func testAddItemUseCase_clearCart_ShouldReceiveAnEmptyCart(){
        //arrange
        let sut = ClearCartUseCase<CartItem>()
        
        //act
        //let cart = sut.execute(toCart: Cart(items: [item1,item2, item3]))
        
        //assert
        XCTAssertTrue(sut.execute().items.isEmpty)
    }

}
