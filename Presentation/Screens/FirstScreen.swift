//
//  FirstScreen.swift
//  CoordinatorSwiftUI
//
//  Created by MOUAD BENJRINIJA on 4/10/2022.
//

import SwiftUI

public struct FirstScreen: Coordinatable {
  public typealias Route = Routes
  @StateObject var viewModel: ViewModel

  public init(viewModel: ViewModel) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }

  public var body: some View {
    VStack {
      Text("First Screen")
      Button(action: viewModel.didTapFirst) {
        Text("Fourth Screen")
      }
    }.navigationBarTitle("First", displayMode: .large)
  }
}

extension FirstScreen {
  public enum Routes: Routing {
    case someOtherFirst
  }
}

extension FirstScreen {
  public class ViewModel: ObservableObject {
    public var navigate: ((Routes) -> Void)?

    public init(navigate: ((Routes) -> Void)? = nil) {
      self.navigate = navigate
    }

    func didTapFirst() {
      navigate?(.someOtherFirst)
    }
  }
}

//struct FirstScreen_Previews: PreviewProvider {
//    static var previews: some View {
//      FirstScreen(viwModel: .init())
//    }
//}
