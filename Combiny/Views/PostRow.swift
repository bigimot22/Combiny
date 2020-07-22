//
//  PostRow.swift
//  Combiny
//
//  Created by Johandre Delgado  on 22.07.2020.
//  Copyright © 2020 Johandre Delgado . All rights reserved.
//

import SwiftUI

struct PostRow: View {
  let post: SimplePost

  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color(UIColor.systemGray6))

      VStack {
        HStack {
          Text(String(post.title.first ?? Character("X")).uppercased())
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(
              Circle()
                .fill(Color.red)
                .frame(width: 60, height: 60)
          )

          VStack(alignment: .leading) {
            Text(post.title.prefix(15))
              .font(.headline)
            Text("User \(post.id)")
              .foregroundColor(Color(UIColor.systemGray2))
          }
          .padding(.horizontal)

          Spacer()
        }

        Text(post.body)
        Divider()
        HStack {
          Spacer()
          Text(post.timestamp.timeAgo()) //  ?? "Some time ago"
            .font(.caption)
            .foregroundColor(Color(UIColor.systemGray2))
        }
      }
      .padding()
    }
  }
}

struct PostRow_Previews: PreviewProvider {
  static var previews: some View {
    PostRow(post: SimplePost(id: 1, title: "Hola mis amigos feos", body: "Esto de Combine mola bien chido y chévere parcero"))
  }
}
