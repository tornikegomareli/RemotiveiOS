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
  func moyaRequestPublisher(_ target: Target) -> AnyPublisher<(data: Data, response: Response), MoyaError> {
    return self.requestPublisher(target)
      .tryMap { response in
        return (data: response.data, response: response)
      }
      .mapError { $0 as! MoyaError }
      .eraseToAnyPublisher()
  }
}
