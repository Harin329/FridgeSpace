//
//  Login.swift
//  Team
//
//  Created by Harin Wu on 2021-01-15.
//

import SwiftUI
import FBSDKLoginKit


struct Login : View {
    @ObservedObject var fbmanager = UserLoginManager()
    @State private var username: String = ""
    @State private var password: String = ""
    @ObservedObject var currentGiver: currentUser
    var body: some View {
        VStack {
            Text("Login")
                .foregroundColor(Color(hex: "#255359"))
                .font(.title)
                .padding(.bottom, 20)
            VStack(spacing: 25) {
                TextField("    Username", text: $username)
                    .frame(width: 260,height:40)
                    .border(Color.gray, width:0.5)
                TextField("    Password", text: $password)
                    .frame(width: 260,height:40)
                    .border(Color.gray, width:0.5)
            }
            
            Button(action: {
            }) {
                HStack {
                    Text("Login")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding([.vertical],10)
                        .frame(width:260)
                }.background(Color(hex: "#255359"))
            }.padding(.top, 60)
            
            Button(action: {
                self.fbmanager.facebookLogin(cUser: currentGiver)
            }) {
                HStack {
                    Image("facebook")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20,height: 20)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                    Text("Login with Facebook")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding(.trailing,20)
                        .padding(.vertical, 10)
                }.padding(.horizontal,8).background(Color(hex: "#5590C3"))
            }
        }
    }
}

