//
//  MainCoordinator.swift
//  CoordinatorSwiftUI
//
//  Created by MOUAD BENJRINIJA on 4/10/2022.
//

import Foundation
import SwiftUI
import Presentation

struct MainCoordinator: Coordinator {
  @State var activeRoute: Destination? = Destination(route: .first)
  @StateObject var viewModel = ContentView.ViewModel()
  @State var transition: Transition?

  var body: some View {
    mainView
      .route(to: $activeRoute)
      .navigation()
      .onAppear {
        viewModel.navigate = navigate(to:)
      }
  }

  var mainView: ContentView {
    return ContentView(viewModel: viewModel)
  }

  func navigate(to route: ContentView.Routes) {
    activeRoute = Destination(route: route)
  }
}

extension MainCoordinator {
  struct Destination: RouteDestination {
    var route: ContentView.Routes

    @ViewBuilder
    var content: some View {
      switch route {
      case .first:
        FirstScreenCoordinator()
      case .sheet:
        SheetScreen()
      case .second(let message):
        SecondScreen(message: message)
      }
    }

    var transition: Transition {
      switch route {
      case .first: return .push
      case .sheet: return .sheet
      case .second: return .sheet
      }
    }
  }
}
