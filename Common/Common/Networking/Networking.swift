//
//  Networking.swift
//  Common
//
//  Created by Jerome on 2020/04/18.
//  Copyright © 2020 podo. All rights reserved.
//

import Combine
import Moya

public final class Networking<Target: TargetType>: MoyaProvider<Target> {

  public init(plugins: [PluginType] = []) {
    super.init(plugins: plugins)
  }

  public func request<Value>(
    _ target: Target,
    file: StaticString = #file,
    function: StaticString = #function,
    line: UInt = #line
  ) -> AnyPublisher<Value, APIError> where Value: Decodable {
    Future<Value, APIError> { promise in
      self.request(target) { result in
        switch result {
        case .success(let response):
          do {
            let value = try JSONDecoder().decode(Value.self, from: response.data)
            promise(.success(value))
          } catch {
            promise(.failure(.parsingError))
          }
        case .failure(let error):
          promise(.failure(.unknown(error)))
        }
      }
    }.eraseToAnyPublisher()
  }
}
