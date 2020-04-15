//
//  AuthProvider.swift
//  AuthService
//
//  Created by Jerome on 2020/04/15.
//  Copyright © 2020 podo. All rights reserved.
//

public enum AuthProvider: RawRepresentable {
  public typealias AuthParam = (id: String, accessToken: String, email: String?)

  case apple(AuthParam)
  case kakao(AuthParam)
}

extension AuthProvider {
  public init?(rawValue: String) {
    preconditionFailure()
  }

  public var rawValue: String {
    switch self {
    case .apple:
      return "apple"
    case .kakao:
      return "kakao"
    }
  }

  public var getEmail: String? {
    switch self {
    case .apple(let param),
         .kakao(let param):
      return param.email
    }
  }
}
