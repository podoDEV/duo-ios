//
//  AuthRemoteRepository.swift
//  AuthService
//
//  Created by Jerome on 2020/04/18.
//  Copyright © 2020 podo. All rights reserved.
//

import Combine
import Common
import Moya

final class AuthRemoteRepository: AuthRemoteDataSource {
  private let networking: AuthNetworking
  
  init(networking: AuthNetworking) {
    self.networking = networking
  }
  
  func login(provider: AuthProvider) -> AnyPublisher<AuthToken, APIError> {
    networking
      .request(.login)
      .eraseToAnyPublisher()
  }
  
  func logout() -> AnyPublisher<Bool, APIError> {
    networking
      .request(.logout)
      .eraseToAnyPublisher()
  }
}
