//
//  APIError.swift
//  Common
//
//  Created by Jerome on 2020/04/13.
//  Copyright © 2020 podo. All rights reserved.
//

import Foundation

public enum APIError: Error {
  case requestError
  case responseError
  case parsingError
  case unknown(Error)
}
