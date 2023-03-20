//
//  NodeAB.swift
//  TypeSupport
//
//  Created by Casey Fleser on 3/20/23.
//

import SwiftUI

enum NodeAB<A: Node, B: Node>: Node, CustomStringConvertible {
    case a(A)
    case b(B)
    
    var title       : String {
        switch self {
            case .a(let node): return node.title
            case .b(let node): return node.title
        }
    }

    @ViewBuilder
    var icon        : some View {
        switch self {
            case .a(let node): node.icon
            case .b(let node): node.icon
        }
    }

    @ViewBuilder
    var content : some View {
        switch self {
            case .a(let node): node.content
            case .b(let node): node.content
        }
    }
    
    var items       : [NodeAB<A.Child, B.Child>]? {
        switch self {
            case .a(let node): return node.items?.map { .a($0) }
            case .b(let node): return node.items?.map { .b($0) }
        }
    }

    var description : String {
        let valueDesc   : String
        
        switch self {
            case .a(let node): valueDesc = ".a: \(String(describing: node))"
            case .b(let node): valueDesc = ".b: \(String(describing: node))"
        }

        return "NodeAB<A-\(A.self), B-\(B.self)>: \(valueDesc)"
    }

    func matchesFilterTerm(_ term: String) -> Bool {
        switch self {
            case .a(let node): return node.matchesFilterTerm(term)
            case .b(let node): return node.matchesFilterTerm(term)
        }
    }
}
