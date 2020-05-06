//
//  ServiceError.swift
//  Common
//
//  Created by Jerome on 2020/04/19.
//  Copyright © 2020 podo. All rights reserved.
//

import Foundation

public enum ServiceError: Error {
  case apiError(APIError)
}
