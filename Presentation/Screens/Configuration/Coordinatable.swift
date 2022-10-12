//
//  Coordinatable.swift
//  Presentation
//
//  Created by MOUAD BENJRINIJA on 12/10/2022.
//

import SwiftUI

// implemented by routes enum inside each view
public protocol Routing: Equatable {}

// implemented by the view that has routes
public protocol Coordinatable: View {
  associatedtype Route: Routing
}
