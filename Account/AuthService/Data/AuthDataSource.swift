//
//  AuthDataSource.swift
//  AuthService
//
//  Created by Jerome on 2020/04/13.
//  Copyright © 2020 podo. All rights reserved.
//

import Combine
import Common

public protocol AuthLocalDataSource {
  func saveToken(authToken: AuthToken) throws
  func loadToken() -> AuthToken?
  func deleteToken()
}

public protocol AuthRemoteDataSource {
  func register(provider: AuthProvider) -> AnyPublisher<String, APIError>
  func login(provider: AuthProvider) -> AnyPublisher<String, APIError>
  func logout()
}
