//
//  AuthService.swift
//  AuthService
//
//  Created by Jerome on 2020/04/13.
//  Copyright © 2020 podo. All rights reserved.
//

import Combine
import Common

public protocol AuthServiceType {
  var currentAuthToken: AuthToken? { get }

  func login(provider: AuthProvider) -> AnyPublisher<Void, APIError>
  func logout() -> AnyPublisher<Void, APIError>
}

public final class AuthService: AuthServiceType {
  
  private(set) public var currentAuthToken: AuthToken?
  
  private let authRepository: AuthRepositoryType
  
  init(authRepository: AuthRepositoryType) {
    self.authRepository = authRepository
  }
  
  public func login(provider: AuthProvider) -> AnyPublisher<Void, APIError> {
    authRepository
      .login(provider: provider)
      .map { token -> Void in
        self.currentAuthToken = token
      }
      .eraseToAnyPublisher()
  }
  
  public func logout() -> AnyPublisher<Void, APIError> {
    authRepository
      .logout()
      .map { success -> Void in _ }
      .eraseToAnyPublisher()
  }
}
