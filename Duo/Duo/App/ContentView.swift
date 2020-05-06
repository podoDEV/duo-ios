//
//  ContentView.swift
//  Duo
//
//  Created by Jerome on 2020/04/19.
//  Copyright © 2020 podo. All rights reserved.
//

import Combine
import SwiftUI
import AuthService

struct ContentView: View {
  @ObservedObject var viewModel: LoginViewModel
  
  init(viewModel: LoginViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(viewModel: LoginViewModel(authService: AuthService()))
  }
}

class LoginViewModel: ObservableObject, Identifiable {
  private let authService: AuthServiceType
  
  init(authService: AuthServiceType) {
    self.authService = authService
  }
  
  func login() {
    let provider = AuthProvider.apple(AuthProvider.AuthParam(id: "", accessToken: "", email: ""))
    authService
      .login(provider: provider)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] value in
        guard self != nil else { return }
        switch value {
        case .failure:
          break
        case .finished:
          break
        }
      }, receiveValue: { [weak self] _ in
          
      })
  }
}
