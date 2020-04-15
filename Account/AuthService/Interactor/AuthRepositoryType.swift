//
//  AuthRepositoryType.swift
//  AuthService
//
//  Created by Jerome on 2020/04/13.
//  Copyright © 2020 podo. All rights reserved.
//

import Combine

public protocol AuthRepositoryType {
  func register(provider: AuthProvider) -> AnyPublisher<AuthToken>
  func login(provider: AuthProvider) -> AnyPublisher<AuthToken>
  func logout()

  func saveToken(authToken: AuthToken) throws
  func loadToken() -> AuthToken?
  func deleteToken()
}
