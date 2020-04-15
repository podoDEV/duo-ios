//
//  AuthLocalRepository.swift
//  AuthService
//
//  Created by Jerome on 2020/04/13.
//  Copyright © 2020 podo. All rights reserved.
//

import KeychainAccess

final class AuthLocalRepository: AuthLocalDataSource {

  private let keychain = Keychain(service: "com.podo.duo")

  func saveToken(authToken: AuthToken) throws {
    try keychain.set(authToken.accessToken, key: "accessToken")
    try keychain.set(authToken.refreshToken, key: "refreshToken")
  }

  func loadToken() -> AuthToken? {
    guard let accessToken = keychain["accessToken"] else { return nil }
    guard let refreshToken = keychain["refreshToken"] else { return nil }
    return AuthToken(accessToken: accessToken, refreshToken: refreshToken)
  }

  func deleteToken() {
    try? keychain.remove("accessToken")
    try? keychain.remove("refreshToken")
  }
}
