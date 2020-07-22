//
//  SimplePost.swift
//  Combiny
//
//  Created by Johandre Delgado  on 22.07.2020.
//  Copyright © 2020 Johandre Delgado . All rights reserved.
//

import Foundation

struct SimplePost: Decodable, Identifiable, Hashable {
  var id: Int
  var title: String
  var body: String
//  var timestamp: Date? = Date()
}

extension SimplePost {
  var timestamp: Date {
    return Calendar.current.date(byAdding: .minute, value: -Int.random(in: 0...20), to: Date())!
  }
}
