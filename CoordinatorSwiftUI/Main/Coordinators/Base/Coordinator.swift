//
//  Coordinator.swift
//  CoordinatorSwiftUI
//
//  Created by MOUAD BENJRINIJA on 5/10/2022.
//

import SwiftUI
import Presentation

// implemented by the route factory
// it manages view creation and transition
protocol RouteDestination: Equatable {
  associatedtype Destination: View
  var content: Destination { get }
  var transition: Transition { get }
}

// implemented by the wrapper view which acts as a coordinator
protocol Coordinator: View {
  associatedtype MainContent: Coordinatable
  associatedtype Destination: RouteDestination
  var mainView: MainContent { get }
  var activeRoute: Destination? { get }
  func navigate(to route: MainContent.Route)
}

extension Coordinator {
  // for deep link chaining
  func then<C: Coordinator>(to route: MainContent.Route, as: C.Type) -> C? {
    return then(to: route) as? C
  }

  func then(to route: MainContent.Route) -> some View {
    navigate(to: route)
    return activeRoute?.content
  }
}
