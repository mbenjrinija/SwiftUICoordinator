//
//  SecondScreen.swift
//  CoordinatorSwiftUI
//
//  Created by MOUAD BENJRINIJA on 4/10/2022.
//

import SwiftUI

public struct SecondScreen: View {
  let message: String

  public init(message: String) {
    self.message = message
  }

  public var body: some View {
    Text("Second Screen \(message)")
  }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
      SecondScreen(message: "test")
    }
}
