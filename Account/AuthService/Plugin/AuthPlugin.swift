//
//  AuthPlugin.swift
//  AuthService
//
//  Created by Jerome on 2020/04/18.
//  Copyright © 2020 podo. All rights reserved.
//

import Moya

public struct AuthPlugin: PluginType {
  private let authService: AuthServiceType

  public init(authService: AuthServiceType) {
    self.authService = authService
  }

  public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    var request = request
//    if let accessToken = self.authUseCase.currentAccessToken {
//      request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
//    }
    return request
  }
}
