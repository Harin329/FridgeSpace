//
//  ContentView.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct ContentView : View {
      
      var body: some View{
          Home().ignoresSafeArea(.all, edges: .vertical)
          
      }
  }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
