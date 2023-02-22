//
//  ViewableType.swift
//  TypeSupport
//
//  Created by Casey Fleser on 2/22/23.
//

import SwiftUI

/// What does a type need to do to be Viewable? Not a lot it turns out.

protocol ViewableType {
    associatedtype TypeContent: View
    
    @ViewBuilder
    var content: TypeContent { get }
}
