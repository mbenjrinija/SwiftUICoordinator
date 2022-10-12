//
//  Coordinator.swift
//  CoordinatorSwiftUI
//
//  Created by MOUAD BENJRINIJA on 4/10/2022.
//

import SwiftUI

struct Coordinator<Content: View>: View {
  @ViewBuilder var content: Content

  @State private var current: Route?
  @State private var sheet = false

  private var childView: some View {
    AnyView {
      current?.view ?? EmptyView()
    }
  }

  var body: some View {
    NavigationView {
      ZStack {
        content
      }
    }
    .sheet(isPresented: $sheet) {
      childView
    }.onChange(of: current, perform: onCurrentChange(_:))
  }

  func onCurrentChange(_ current: Route?) {
    sheet = false
    switch current {
    case .sheet:
      sheet = true
    default:
      return
    }
  }

}

extension Coordinator {
  enum Route: Equatable {
    case push(Destination)
    case modal(Destination)
    case sheet(Destination)

    var view: any View {
      switch self {
      case .push(let dest): return dest.view
      case .modal(let dest): return dest.view
      case .sheet(let dest): return dest.view
      }
    }
  }

  enum Destination: Equatable {
    case firstScreen
    case secondScreen(String)

    var view: any View {
      switch self {
      case .firstScreen:
        return FirstScreen()
      case .secondScreen(_):
        return SecondScreen()
      }
    }



  }

}

//struct Coordinator_Previews: PreviewProvider {
//    static var previews: some View {
//        Coordinator()
//    }
//}
