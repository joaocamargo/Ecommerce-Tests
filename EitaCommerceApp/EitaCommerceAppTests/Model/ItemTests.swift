//
//  ItemTests.swift
//  EitaCommerceAppTests
//
//  Created by joao camargo on 28/08/21.
//

import XCTest

@testable import EitaCommerceApp


class ItemTests: XCTestCase {
    
    let sut = Item(id: 1,
                   name: "Product",
                   price: 12.99,
                   category: .menClothing,
                   description: "description",
                   imageStringUrl: "http://image.com")
    
    
    func testItem_Init_shouldRetainProperties()  {
        
        //act
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.id,  1)
        XCTAssertEqual(sut.name,  "Product")
        XCTAssertEqual(sut.price,  12.99)
        XCTAssertEqual(sut.category,  .menClothing)
        XCTAssertEqual(sut.description,  "description")
        XCTAssertEqual(sut.imageStringUrl,  "http://image.com")
        
        //assert
        
    }
    
    func testItem_Codable_ShouldEncondeAndDecodeItem() throws {

        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        let data = try encoder.encode(sut)
        let decodedValue = try decoder.decode(Item.self,from: data)
        
        XCTAssertEqual(sut, decodedValue)
    }
    
    func testItem_decodeJSONString_ShouldDecodeToItem() {
        
        let expectedItem =  Item(id: 1,
                                 name: "Product",
                                 price: 12.99,
                                 category: .menClothing,
                                 description: "description",
                                 imageStringUrl: "http://image.com")
        
        let JSONString = """
         {
                \"id\": 1,
                \"title\": \"Product\",
                \"price\": 12.99,
                \"category\": \"men's clothing\",
                \"description\": \"description\",
                \"image\": \"http://image.com\"
        }
        """
                
        let data = JSONString.data(using: .utf8)!
        print("Data \(data)")
       // let decodedValue = try? decoder.decode(Item.self,from: data)
        let decodedValue = try? decodeJsonErrors(Item.self, data)
       

        XCTAssertEqual(expectedItem, decodedValue)

    }
    
    func testItem_decodeJSONString_ShouldFail() {
        
        let wrongJSONString = """
         {
                \"id\": 1,
                \"title\": \"Product\",
                \"price\": 12.99,
                \"category\": \"clothing\",
                \"description\": \"description\",
                \"image\": \"http://image.com\"
        }
        """
                
        let data = wrongJSONString.data(using: .utf8)!
        XCTAssertThrowsError(try decodeJsonErrors(Item.self, data))

    }
    
    func decodeJsonErrors<T:Codable>(_ type: T.Type, _ valueToDecode: Data) throws -> T {
        
        var messages: T
        let decoder = JSONDecoder()

        do {
            messages = try decoder.decode(type.self, from: valueToDecode)
            return messages
            print(messages as Any)
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        return try decoder.decode(type.self, from: Data())
    }
}
