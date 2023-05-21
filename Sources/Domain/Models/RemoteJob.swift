//
//  RemoteJob.swift
//  Remotive
//
//  Created by Tornike on 21/05/2023.
//

import Foundation

struct RemoteJob {
  let id: Int
  let url: URL
  let title: String
  let companyName: String
  let companyLogo: URL
  let category: String
  let jobType: String?
  let publicationDate: Date
  let candidateRequiredLocation: String
  let salary: String?
  let description: String
}

extension RemoteJob: Codable {
  enum CodingKeys: String, CodingKey {
    case id
    case url
    case title
    case companyName = "company_name"
    case companyLogo = "company_logo"
    case category
    case jobType = "job_type"
    case publicationDate = "publication_date"
    case candidateRequiredLocation = "candidate_required_location"
    case salary
    case description
  }
}

extension RemoteJob: Equatable, Hashable { }
