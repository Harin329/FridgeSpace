//
//  ContentView.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

class currentUser: ObservableObject {
    @Published var user = User(facebookId: "", name: "", email: "", id: 0)
}

struct ContentView : View {
    
    @ObservedObject var currentGiver = currentUser()
    var body: some View{
        if (currentGiver.user.facebookId != "") {
            Home().ignoresSafeArea(.all, edges: .vertical).statusBar(hidden: true)
        } else {
            Onboarding(currentGiver: currentGiver).ignoresSafeArea(.all, edges: .vertical).statusBar(hidden: true)
        }
    }
}
