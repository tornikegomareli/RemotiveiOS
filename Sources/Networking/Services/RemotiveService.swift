//
//  RemotiveService.swift
//  Remotive
//
//  Created by Tornike on 20/05/2023.
//

import Moya
import Combine
import Foundation
import ComposableArchitecture

class RemotiveService {
  let provider: MoyaProvider<RemotiveJobsTarget>
  let networking: Networking

  init(
    networking: @escaping Networking,
    provider: MoyaProvider<RemotiveJobsTarget> = MoyaProvider<RemotiveJobsTarget>()) {
    self.networking = networking
    self.provider = provider
  }

  func getJobs() -> AppResponse {
    return networking(RemotiveJobsTarget.getJobs)
  }
}
