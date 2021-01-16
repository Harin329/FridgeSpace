//
//  MenuBar.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct MenuBar: View {
    var menuButtons = ["Home","Resources","Veggie"]
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @Binding var showing: Int
    @Binding var x: CGFloat
    var body: some View{
        HStack(spacing: 0){
            VStack(alignment: .leading){
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                HStack(alignment: .top, spacing: 12) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Harin Brisland")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        // Stats...
                        VStack(spacing: 10){
                            Stats(count: 8, title: "ppl feed")
                                .onTapGesture {
                                }
                            Stats(count: 108, title: "meals donated")
                                .onTapGesture {
                                    // do something here....
                                }
                        }
                        .padding(.top,10)
                        Divider()
                            .padding(.top,10)
                    }
                    Spacer(minLength: 0)
                }
                // Different Views When up or down buttons pressed....
                VStack(alignment: .leading){
                    // Menu Buttons....
                    ForEach(menuButtons,id: \.self){menu in
                        Button(action: {
                            // switch your actions or work based on title....
                            if menu == "Home" {
                                showing = 0
                            }
                            else if menu == "Resources" {
                                showing = 1
                            }
                            else if menu == "Veggie" {
                                showing = 2
                            }
                            withAnimation{
                                x = -UIScreen.main.bounds.width + 90
                            }
                        }) {
                            MenuButton(title: menu)
                        }
                    }
                    Divider()
                        .padding(.top)
                    Button(action: {
                        // switch your actions or work based on title....
                    }) {
                        MenuButton(title: "Upload")
                    }
                    Divider()
                    Button(action: {}) {
                        Text("Settings and privacy")
                            .foregroundColor(.black)
                    }
                    .padding(.top)
                    Button(action: {}) {
                        Text("Help centre")
                            .foregroundColor(.black)
                    }
                    .padding(.top,20)
                    Spacer(minLength: 0)
                }
            }
            .padding(.horizontal,20)
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
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)
            Text(title)
                .foregroundColor(.black)
            Spacer(minLength: 0)
        }
        .padding(.vertical,12)
    }
}
