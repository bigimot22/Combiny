//
//  DataManager.swift
//  Combiny
//
//  Created by Johandre Delgado  on 21.07.2020.
//  Copyright © 2020 Johandre Delgado . All rights reserved.
//
import Foundation
import Combine

struct SimplePost: Decodable, Identifiable, Hashable {
  var id: Int
  var title: String
  var body: String
}


enum DataLoader {
  static func loadPosts(from url: URL) -> AnyPublisher<[SimplePost], Error> {
    URLSession.shared.dataTaskPublisher(for: url)
      .receive(on: RunLoop.main)
      .map({ $0.data })
      .decode(type: [SimplePost].self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}

class DataManager: ObservableObject {
  @Published private(set) var posts = [SimplePost]()
  private var token: Cancellable?

  func loadStores() {
    let path = "https://jsonplaceholder.typicode.com/posts"
    token?.cancel()

    let url = URL(string: path)!
    token = DataLoader.loadPosts(from: url)
      .sink(receiveCompletion: { print("receiveCompletion: \($0)") }, receiveValue: { [weak self] result in
      self?.posts = result
        print("receiveValue count: \(result.count)") })
  }

}
