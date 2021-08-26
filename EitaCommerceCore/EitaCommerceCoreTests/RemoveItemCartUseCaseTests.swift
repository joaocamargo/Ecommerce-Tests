//
//  AddICartUseCaseTest.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 24/08/21.
//

import XCTest
import EitaCommerceCore

protocol RemoveItemCartUseCaseProtocol {
    associatedtype Item: CartItemEquatable
    func execute(_ item: Item, toCart card: Cart<Item>) -> Cart<Item>
}

class RemoveItemCartUseCase<Item: CartItemEquatable> : AddItemCartUseCaseProtocol {
    
    func execute(_ item: Item, toCart cart: Cart<Item>) -> Cart<Item> {
        
        var items = cart.getItems()
        
        guard let itemIndex = items.firstIndex(where: { $0 == item }) else {
            return cart
        }
        
        let item = items[itemIndex]
        
        if item.quantity > 1 {
            item.setQuantity(item.quantity - 1)
        } else {
            items.remove(at: itemIndex)
        }
        return Cart(items: items)
    }
}

class  RemoveItemCartUseCaseTest: XCTestCase {
    
    let item1 = CartItem(item: Item(name: "Item 1", price: 10))
    let item2 = CartItem(item: Item(name: "Item 2", price: 10))
    let item3 = CartItem(item: Item(name: "Item 3", price: 10))
    
    func testRemoveItemUseCase_removeOneItemShouldReceiveCartWithOneItem(){
        //arrange
        let sut = RemoveItemCartUseCase<CartItem>()
        
        //act
        let cart = sut.execute(item1, toCart: Cart(items: [item1, item2]))
        
        
        //assert
        XCTAssertEqual(cart.getItems().count, 1)
        XCTAssertEqual(cart.getItems().first!, item2)
        XCTAssertEqual(cart.getItems().last!, item2)
    }
    
    func testRemoveItemUseCase_removeOneItemWithQuantityOfTwo_ShouldReceiveCartWithTwoItems(){

        let sut = RemoveItemCartUseCase<CartItem>()
        
        let item = CartItem(item: Item(name: "Item", price: 10))
        item.setQuantity(2)
        
        //var cart = Cart.init(items: [item,item2])
        //cart.removeItem(item)
        
        let cart = sut.execute(item1, toCart: Cart(items: [item, item2]))
    
        
        XCTAssertEqual(cart.getItems().count, 2)
        XCTAssertEqual(cart.getItems().first!, item)
        XCTAssertEqual(cart.getItems().last!, item2)
    }
    

}
