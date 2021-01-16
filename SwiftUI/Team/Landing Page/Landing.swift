//
//  Landing.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct Landing: View {
    @State var show = false
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Header().frame(height: UIScreen.main.bounds.height / 5)
                        .border(Color.black)
                    Tools().frame(height: UIScreen.main.bounds.height / 3)
                    Spacer()
                }
                Button(action: {
                    show.toggle()
                }) {
                    VStack {
                        MapView()
                    }.allowsHitTesting(show)
                }.offset(y: show ? 0 : UIScreen.main.bounds.height / 1.8 )
            }
        }.ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
