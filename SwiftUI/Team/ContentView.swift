//
//  ContentView.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

var loggedIn = true

struct ContentView : View {
      
      var body: some View{
        if (loggedIn) {
            Home().ignoresSafeArea(.all, edges: .vertical)
        } else {
            Login().ignoresSafeArea(.all, edges: .vertical)
        }
      }
  }

