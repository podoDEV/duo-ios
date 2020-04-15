//
//  AuthRepository.swift
//  AuthService
//
//  Created by Jerome on 2020/04/13.
//  Copyright © 2020 podo. All rights reserved.
//

import Combine
import Common

public class AuthRepository: AuthRepositoryType {

  private let local: AuthLocalDataSource
  private let remote: AuthRemoteDataSource

  public init(
    local: AuthLocalDataSource,
    remote: AuthRemoteDataSource
  ) {
    self.local = local
    self.remote = remote
  }

  public func register(provider: AuthProvider) -> AnyPublisher<String, APIError> {
    remote.register(provider: provider)
  }

  public func login(provider: AuthProvider) -> AnyPublisher<String, APIError> {
    remote.login(provider: provider)
  }

  public func logout() {

  }

  public func saveToken(authToken: AuthToken) throws {
    try local.saveToken(authToken: authToken)
//    log.debug("AuthToken saved at local")
  }

  public func loadToken() -> AuthToken? {
    local.loadToken()
  }

  public func deleteToken() {
    local.deleteToken()
  }
}
