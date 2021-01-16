//
//  HomePage.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct HomePage : View {
    
    @Binding var x : CGFloat
    @Binding var showing: Int
    var body: some View{
        // Home View With CUstom Nav bar...
        VStack{
            HStack{
                Button(action: {
                    // opening menu,...
                    withAnimation{
                        x = 0
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                }
                Spacer(minLength: 0)
                Text("Food Buds")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer(minLength: 0)
                Button(action: {
                    // Todo
                }) {
                    Image(systemName: "camera")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .padding(.trailing, 10)
                }
            }
            .padding(.top, 40)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            if showing == 0 {
                MapView()
            }
            else if showing == 1 {
                Resources()
            }
        }
        // for drag gesture...
        .contentShape(Rectangle())
        .background(Color.white)
    }
}
