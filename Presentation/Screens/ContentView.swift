//
//  ContentView.swift
//  CoordinatorSwiftUI
//
//  Created by MOUAD BENJRINIJA on 4/10/2022.
//

import SwiftUI
import Combine

public struct ContentView: Coordinatable {
  public typealias Route = Routes

  @ObservedObject var viewModel: ViewModel

  public init(viewModel: ViewModel) {
    self.viewModel = viewModel
  }

  public var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, world!")
        .padding(.bottom)
      Button(action: viewModel.didTapFirst) {
        Text("First Screen")
      }
      Button(action: viewModel.didTapSheet) {
        Text("Sheet")
      }
      Button(action: viewModel.didTapSecond) {
        Text("Second Screen")
      }
    }
    .padding()
  }
}

extension ContentView {
  public class ViewModel: ObservableObject {
    public var navigate: ((Routes) -> Void)?

    public init(navigate: ((Routes) -> Void)? = nil) {
      self.navigate = navigate
    }

    func didTapFirst() {
      navigate?(.first)
    }

    func didTapSheet() {
      navigate?(.sheet)
    }

    func didTapSecond() {
      navigate?(.second("U made it"))
    }
  }
}

extension ContentView {
  public enum Routes: Routing {
    case first
    case sheet
    case second(String)
  }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
