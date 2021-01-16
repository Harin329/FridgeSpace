//
//  Landing.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct Landing: View {
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Header().frame(height: UIScreen.main.bounds.height / 3)
                    Spacer()
                }
                VStack {
                    Spacer()
                    VStack {
                        Text("Placeholder")
                    }
                    Spacer()
                }
                VStack {
                    Spacer()
                    MapView().frame(height: UIScreen.main.bounds.height / 3)
                }.ignoresSafeArea(.all, edges: .bottom)
            }
        }.ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
