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
  let networking: Networking

  init(networking: @escaping Networking) {
    self.networking = networking
  }

  func getJobs() -> AppResponse {
    return networking(RemotiveJobsTarget.getJobs)
  }
}
