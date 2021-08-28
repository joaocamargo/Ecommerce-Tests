//
//  EitaCommerceCoreTests.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 28/08/21.
//

import XCTest
@testable import EitaCommerceCore

public final class EitaCommerceCore<Item: CartItemEquatable> {
    
    var cart = Cart(items: [Item]())
    let addItemCartUseCase = AddItemCartUseCase<Item>()
    let removeItemCartUseCase = RemoveItemCartUseCase<Item>()
    let clearCartUseCase = ClearCartUseCase<Item>()
    
    var currentCart: Cart<Item> {
        cart
    }
    
    public static func startWith(items: [Item]) -> EitaCommerceCore {
        let eita = EitaCommerceCore()
        
        items.forEach { item in
            _ = eita.add(item: item)
        }
        
        return eita
    }
    
    func add(item: Item) -> Cart<Item> {
       cart = addItemCartUseCase.execute(item, toCart: cart)
       return cart
    }
    
    func remove(item: Item) -> Cart<Item> {
       cart = removeItemCartUseCase.execute(item, toCart: cart)
       return cart
    }
    
    func clear() -> Cart<Item> {
        cart =  clearCartUseCase.execute()
        return cart
    }
    
}


class EitaCommerceCoreTests: XCTestCase {
    
    
    let item =  CartItem(item: Item(name: "Item 1", price: 10.0))
    
    func testEitaCommerceCore_start_ShouldReturnValidEitaCommerceCore(){
        //arrange
        let sut = EitaCommerceCore.startWith(items: [CartItem]())
        
        XCTAssertNotNil(sut)
        
    }
    
    func testEitaCommerceCore_StartWithItems_ShouldReturnEitaCommerceCoreWithPopulatedCardWithItems(){
        let sut = EitaCommerceCore.startWith(items: [item])
            
        XCTAssertEqual(sut.currentCart.items.count, 1)
        XCTAssertEqual(sut.currentCart.items , [item])

    }
    
    func testEitaCommerceCore_addItem_ShouldReturnCartWithItem(){
        //arrange
        let sut = EitaCommerceCore.startWith(items: [CartItem]())
        
        //act
        let cart = sut.add(item: item)
        
        //assert
        XCTAssertEqual(cart.items.count, 1)
        XCTAssertEqual(cart.items, [item])

        XCTAssertEqual(sut.currentCart.items.count, 1)
        XCTAssertEqual(sut.currentCart.items , [item])
    }
    
    func testEitaCommerceCore_removeItem_ShouldReturnCartWithoutItem(){
        //arrange
        let sut = EitaCommerceCore.startWith(items: [CartItem]())
        
        //act
        let cart = sut.remove(item: item)
        
        //assert
        XCTAssertEqual(cart.items.count, 0)
        XCTAssertEqual(cart.items, [])

        XCTAssertEqual(sut.currentCart.items.count, 0)
        XCTAssertEqual(sut.currentCart.items , [])
    }
    
    func testEitaCommerceCore_clearItem_ShouldReturnCartWithoutItem(){
        //arrange
        let sut = EitaCommerceCore.startWith(items: [CartItem]())
        
        //act
        let cart = sut.clear()
        
        //assert
        XCTAssertEqual(cart.items.count, 0)
        XCTAssertEqual(cart.items, [])

        XCTAssertEqual(sut.currentCart.items.count, 0)
        XCTAssertEqual(sut.currentCart.items , [])
    }
}
