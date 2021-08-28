//
//  Ext+Array.swift
//  EitaCommerceCore
//
//  Created by joao camargo on 23/08/21.
//

import Foundation


extension Array {

    func filterDuplicates(_ includeElement: (_ lhs:Element, _ rhs:Element) -> Bool) -> [Element]{
        var results = [Element]()
        forEach { (element) in
            let existingElements = results.filter {
                return includeElement(element, $0)
            }
            if existingElements.count == 0 {
                results.append(element)
            }
        }

        return results
    }
}
