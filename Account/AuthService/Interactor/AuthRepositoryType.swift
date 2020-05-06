//
//  AuthRepositoryType.swift
//  AuthService
//
//  Created by Jerome on 2020/04/13.
//  Copyright © 2020 podo. All rights reserved.
//

import Combine
import Common

public protocol AuthRepositoryType {
  func login(provider: AuthProvider) -> AnyPublisher<AuthToken, APIError>
  func logout() -> AnyPublisher<Bool, APIError>

  func saveToken(authToken: AuthToken) throws
  func loadToken() -> AuthToken?
  func deleteToken()
}
