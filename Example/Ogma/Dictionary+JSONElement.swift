//
//  Dictionary+JSONParsable.swift
//  Ogma_Example
//
//  Created by Mathias Quintero on 4/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import Ogma

extension Dictionary: Parsable where Key == String, Value == JSON {
    public typealias Token = JSON.Token

    public static let parser: AnyParser<JSON.Token, Dictionary<String, JSON>> = {
        let element = String.self && .colon && json.self

        return element
            .separated(by: .comma)
            .map { Dictionary($0, uniquingKeysWith: { $1 }) }
            .optional()
            .wrapped(by: .openCurlyBracket, and: .closeCurlyBracket)
            .map { $0 ?? [:] }
    }()

    var json: JSON {
        return .dictionary(self)
    }
}

extension Dictionary: JSONElement where Key == String, Value == JSON { }
