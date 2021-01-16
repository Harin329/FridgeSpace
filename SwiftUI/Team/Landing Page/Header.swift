//
//  Header.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack {
            Image("header0")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
            VStack {
                Spacer()
                HeaderBar()
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
    }
}

struct HeaderBar: View {
    var body: some View {
        HStack(spacing: 4) {
            Capsule()
                .foregroundColor(Color(hex: "#3E6E79"))
                .shadow(color: .white, radius: 0.5)
                .frame(width: 40, height: 5)
            Capsule()
                .foregroundColor(Color(hex: "#fff"))
                .frame(width: 40, height: 5)
            Capsule()
                .foregroundColor(Color(hex: "#fff"))
                .frame(width: 40, height: 5)
            Capsule()
                .foregroundColor(Color(hex: "#fff"))
                .frame(width: 40, height: 5)
        }.padding(.bottom, 20)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
