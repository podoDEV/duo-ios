//
//  AuthToken.swift
//  AuthService
//
//  Created by Jerome on 2020/04/15.
//  Copyright © 2020 podo. All rights reserved.
//

public typealias Token = String

public struct AuthToken: Codable {
  public let accessToken: Token
  public let refreshToken: Token

  public init(accessToken: Token, refreshToken: Token) {
    self.accessToken = accessToken
    self.refreshToken = refreshToken
  }
}
