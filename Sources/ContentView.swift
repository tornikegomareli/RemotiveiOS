//
//  ContentView.swift
//  Remotive
//
//  Created by Tornike on 20/05/2023.
//

import SwiftUI
import Moya
import Combine

struct ContentView: View {
  @State private var jobsData: Data = Data()
  @State private var cancellables = Set<AnyCancellable>()
  private let service = RemotiveService(networking: MoyaProvider<RemotiveJobsTarget>().publisherWith)


  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
    }
    .padding()
    .onAppear {
      service.getJobs()
        .sink(receiveCompletion: { completion in
          if case .failure(let error) = completion {
            print("Error: \(error)")
          }
        }, receiveValue: { data, response in
          self.jobsData = data
          print("\(jobsData)")
        })
        .store(in: &self.cancellables)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
