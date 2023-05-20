//
//  RemotiveJobs.swift
//  Remotive
//
//  Created by Tornike on 20/05/2023.
//

import Foundation
import Moya

public enum RemotiveJobsTarget {
  case getJobs
}

extension RemotiveJobsTarget: TargetType {
  public var baseURL: URL {
    return URL(string: "https://remotive.com/api/")!
  }

  public var path: String {
    return "remote-jobs"
  }

  public var method: Moya.Method {
    return .get
  }

  public var task: Moya.Task {
    return .requestPlain
  }

  public var headers: [String : String]? {
    return nil
  }
}
