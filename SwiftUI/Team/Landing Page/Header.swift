//
//  Header.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct Header: View {
    @State var slide = 0
    var body: some View {
        ZStack {
            Image("header0")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
            VStack {
                Spacer()
                HeaderBar(capsuleColor: Color(hex: "#fff"), highlightColor: Color(hex: "#3E6E79"), slide: $slide, total: 4)
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
    }
}

struct HeaderBar: View {
    var capsuleColor: Color
    var highlightColor: Color
    @Binding var slide: Int
    var total : Int
    var body: some View {
        HStack(spacing: 4) {
            Capsule()
                .foregroundColor((slide == 0) ? highlightColor : capsuleColor)
                .shadow(color: .white, radius: (slide == 0) ? 0.5 :0)
                .frame(width: 40, height: 5)
            Capsule()
                .foregroundColor((slide == 1) ? highlightColor : capsuleColor)
                .shadow(color: .white, radius: (slide == 1) ? 0.5 :0)
                .frame(width: 40, height: 5)
            Capsule()
                .foregroundColor((slide == 2) ? highlightColor : capsuleColor)
                .shadow(color: .white, radius: (slide == 2) ? 0.5 :0)
                .frame(width: 40, height: 5)
            Capsule()
                .foregroundColor((slide == 3) ? highlightColor : capsuleColor)
                .shadow(color: .white, radius: (slide == 3) ? 0.5 :0)
                .frame(width: 40, height: 5)
            if total > 4 {
                Capsule()
                    .foregroundColor((slide == 4) ? highlightColor : capsuleColor)
                    .shadow(color: .white, radius: (slide == 4) ? 0.5 :0)
                    .frame(width: 40, height: 5)
            }
        }.padding(.bottom, 20)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
