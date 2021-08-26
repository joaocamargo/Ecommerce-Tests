//
//  MockItem.swift
//  EitaCommerceCoreTests
//
//  Created by joao camargo on 25/08/21.
//

import Foundation
import EitaCommerceCore
//MARK: - Helper

struct Item: ItemProtocol {
    var id = UUID()
    var name: String
    var price: Double
}
