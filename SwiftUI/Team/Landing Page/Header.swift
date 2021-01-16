//
//  Header.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack {
            Rectangle().fill(Color(hex: "#9CC3AC"))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
