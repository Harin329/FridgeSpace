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
                    Header().frame(height: UIScreen.main.bounds.height / 3)
                        .border(Color.black)
                    Tools().frame(height: UIScreen.main.bounds.height / 3)
                    Spacer()
                }
                ZStack {
                    VStack {
                        MapView(show: $show)
                    }.allowsHitTesting(show)
                    Button(action: {
                        if !show {
                            show.toggle()
                        }
                    }) {
                        Rectangle()
                            .foregroundColor(Color.clear)
                            .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    }.opacity(show ? 0 : 1)
                }.offset(y: show ? 0 : UIScreen.main.bounds.height / 1.5 )
            }
        }.ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
