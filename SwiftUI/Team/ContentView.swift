//
//  ContentView.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

var loggedIn = false

struct ContentView : View {
      
      var body: some View{
        if (loggedIn) {
            Home().ignoresSafeArea(.all, edges: .vertical).statusBar(hidden: true)
        } else {
            Login2().ignoresSafeArea(.all, edges: .vertical)
        }
      }
  }

