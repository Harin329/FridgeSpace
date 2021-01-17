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
    @Binding var login: Bool

    var body: some View {
        VStack {
            Image("fridgeSpace2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 80)
                .padding(.bottom, 20)

            VStack(spacing: 25) {
                TextField("    Username", text: $username)
                    .frame(width: 260,height:30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("    Password", text: $password)
                    .frame(width: 260,height:30)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

            }
            
            Button(action: {
                login.toggle()
            }) {
                HStack {
                    Text("Login")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding([.vertical],15)
                        .frame(width:260)
                }.background(Color(hex: "#255359"))
                .cornerRadius(10)
            }.padding(.top, 40)
            
            Button(action: {
                self.fbmanager.facebookLogin(cUser: currentGiver)
            }) {
                HStack {
                    Image("facebook")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25,height: 25)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                    Text("Login with Facebook")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding(.trailing,20)
                        .padding(.vertical, 15)
                }.padding(.horizontal,8).background(Color(hex: "#5590C3")).cornerRadius(10)
            }
        }
    }
}

