//
//  DataResponse.swift
//  Remotive
//
//  Created by Tornike on 21/05/2023.
//

import Foundation

struct JobResponse {
  let legalNotice: String
  let jobCount: Int
  let jobs: [RemoteJob]
}

extension JobResponse: Codable {
  enum CodingKeys: String, CodingKey {
    case legalNotice = "0-legal-notice"
    case jobCount = "job-count"
    case jobs
  }
}

extension JobResponse: Equatable, Hashable { }
