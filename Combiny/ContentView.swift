//
//  ContentView.swift
//  Combiny
//
//  Created by Johandre Delgado  on 21.07.2020.
//  Copyright © 2020 Johandre Delgado . All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var dataManager = DataManager()

    var body: some View {
      NavigationView {
        List(dataManager.posts) { post in
          ZStack {
            Rectangle()
              .foregroundColor(Color(UIColor.systemGray6))
            VStack {
              HStack {
                Text(String(post.title.first ?? Character("X")).uppercased())
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Circle()
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
            }
          .padding()
          }
        }.onAppear {
          self.dataManager.loadStores()
          print("onAppear: \(self.dataManager.posts.count)")
        }
      .navigationBarTitle("Main")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
