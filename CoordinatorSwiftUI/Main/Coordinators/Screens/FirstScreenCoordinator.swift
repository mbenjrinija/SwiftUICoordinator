//
//  FirstScreenCoordinator.swift
//  CoordinatorSwiftUI
//
//  Created by MOUAD BENJRINIJA on 12/10/2022.
//


import Foundation
import SwiftUI
import Presentation

struct FirstScreenCoordinator: Coordinator {
  @State var activeRoute: Destination?
  @StateObject var viewModel = FirstScreen.ViewModel()
  @State var transition: Transition?

  var body: some View {
    mainView
      .route(to: $activeRoute)
      .onAppear {
        viewModel.navigate = navigate(to:)
      }
  }

  var mainView: FirstScreen {
    return FirstScreen(viewModel: viewModel)
  }

  func navigate(to route: FirstScreen.Routes) {
    activeRoute = Destination(route: route)
  }
}

extension FirstScreenCoordinator {
  struct Destination: RouteDestination {
    var route: FirstScreen.Routes

    @ViewBuilder
    var content: some View {
      switch route {
      case .someOtherFirst:
        FourthScreen()
      }
    }

    var transition: Transition {
      switch route {
      case .someOtherFirst: return .push
      }
    }
  }
}
