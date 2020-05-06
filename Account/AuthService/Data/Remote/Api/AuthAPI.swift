//
//  AuthAPI.swift
//  AuthService
//
//  Created by Jerome on 2020/04/18.
//  Copyright © 2020 podo. All rights reserved.
//

import Common
import Moya

typealias AuthNetworking = Networking<AuthAPI>

enum AuthAPI {
  case login
  case logout
}

extension AuthAPI: TargetType {
  var baseURL: URL {
    return URL(string: "")!
  }

  var path: String {
    switch self {
    case .login: return "member"
    case .logout: return "member"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .login: return .post
    case .logout: return .post
    }
  }

  var task: Task {
    switch self {
    default:
      return .requestPlain
    }
  }
  
  var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }
  
  var sampleData: Data {
    switch self {
    default:
      return Data()
    }
  }
}
