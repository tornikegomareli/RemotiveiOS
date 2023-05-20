//
//  Networking.swift
//  Remotive
//
//  Created by Tornike on 20/05/2023.
//

import Foundation
import Combine
import Moya
import CombineMoya

typealias AppResponse =
  AnyPublisher<(data: Data, response: Response), MoyaError>

typealias Networking = (TargetType) -> AppResponse

extension MoyaProvider {
  func publisherWith(_ target: Target) -> AppResponse {
    return self.requestPublisher(target)
      .tryMap { response in
        return (data: response.data, response: response)
      }
      .mapError { $0 as! MoyaError }
      .eraseToAnyPublisher()
  }
}
