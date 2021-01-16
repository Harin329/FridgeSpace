//
//  MenuBar.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct MenuBar: View {
    var menuButtons = ["Statistics","Messages","Notifications", "History"]
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @Binding var showing: Int
    @Binding var x: CGFloat
    var body: some View{
        HStack(spacing: 0){
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .clipShape(Circle())
                    .padding([.top], 20)
                HStack(alignment: .top, spacing: 12) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Sarah Thompson")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "#255359"))
                        HStack{
                            Text("30")
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "#9CC3AC"))
                            
                            Text("Meals Donated")
                                .foregroundColor(Color(hex: "#255359"))
                        }
                        .padding(.top,10)
                        Divider()
                            .padding(.vertical)
                    }
                    Spacer(minLength: 0)
                }
                // Different Views When up or down buttons pressed....
                VStack(alignment: .leading){
                    // Menu Buttons....
                    ForEach(menuButtons,id: \.self){menu in
                        Button(action: {
                            // switch your actions or work based on title....
                            if menu == "Statistics" {
                                showing = 0
                            }
                            else if menu == "Messages" {
                                showing = 1
                            }
                            else if menu == "Notifications" {
                                showing = 2
                            }
                            else if menu == "History" {
                                showing = 3
                            }
                            withAnimation{
                                x = -UIScreen.main.bounds.width + 90
                            }
                        }) {
                            MenuButton(title: menu)
                        }
                    }
                    Divider()
                        .padding(.vertical)
                    Button(action: {}) {
                        Text("Settings")
                            .foregroundColor(Color(hex: "#255359"))
                    }
                    .padding(.top)
                    Button(action: {}) {
                        Text("Help centre")
                            .foregroundColor(Color(hex: "#9CC3AC"))
                    }
                    .padding(.top,20)
                    Spacer(minLength: 0)
                }
            }
            .padding(.horizontal,30)
            // since vertical edges are ignored....
            .padding(.top,edges!.top == 0 ? 15 : edges?.top)
            .padding(.bottom,edges!.bottom == 0 ? 15 : edges?.bottom)
            // default width...
            .frame(width: UIScreen.main.bounds.width - 90)
            .background(Color.white)
            .ignoresSafeArea(.all, edges: .vertical)
            Spacer(minLength: 0)
        }
    }
}

struct MenuButton : View {
    var title : String
    var body: some View{
        HStack(spacing: 15){
            // both title and image names are same....
            Image(title)
                .resizable()
                .frame(width: 24, height: 24)
            Text(title)
                .foregroundColor(Color(hex: "#255359"))
            Spacer(minLength: 0)
        }
        .padding(.vertical,12)
    }
}
