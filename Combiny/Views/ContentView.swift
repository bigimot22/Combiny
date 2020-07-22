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
          PostRow(post: post)
        }
        .onAppear {
          self.dataManager.loadPosts()
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


