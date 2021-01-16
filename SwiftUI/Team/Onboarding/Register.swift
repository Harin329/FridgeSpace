//
//  Login2.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-16.
//

import SwiftUI
import FBSDKLoginKit

struct Register: View {
    @ObservedObject var fbmanager = UserLoginManager()
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    @ObservedObject var currentGiver: currentUser
    var body: some View {
        VStack {
            Text("Register")
                .foregroundColor(Color(hex: "#255359"))
                .font(.title)
                .padding(.bottom, 20)
            VStack(spacing: 25) {
                TextField("    Username", text: $username)
                    .frame(width: 260,height:40)
                    .border(Color.gray, width:0.5)
                TextField("    Email", text: $email)
                    .frame(width: 260,height:40)
                    .border(Color.gray, width:0.5)
                TextField("    Password", text: $password)
                    .frame(width: 260,height:40)
                    .border(Color.gray, width:0.5)
                TextField("    Confirm Password", text: $password2)
                    .frame(width: 260,height:40)
                    .border(Color.gray, width:0.5)
            }
            
            Button(action: {
            }) {
                HStack {
                    Text("Sign up")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding([.vertical],10)
                        .frame(width:260)
                }.background(Color(hex: "#255359"))
            }.padding(.top, 20)
            
            Text("OR")
                .foregroundColor(Color(hex: "#255359"))
                .font(.body)
                .padding(20)

            
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
                    Text("Sign up with Facebook")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding(.trailing,20)
                        .padding(.vertical, 10)
                }.background(Color(hex: "#5590C3"))
            }
        }
    }
}

class UserLoginManager: ObservableObject {
    let loginManager = LoginManager()
    func facebookLogin(cUser: currentUser) {
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: nil) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in! \(grantedPermissions) \(declinedPermissions) \(accessToken)")
                GraphRequest(graphPath: "me", parameters: ["fields": "id, name, email, first_name"]).start(completionHandler: { (connection, result, error) -> Void in
                    if (error == nil){
                        let fbDetails = result as! NSDictionary
                        print(fbDetails)
                        let user = User(facebookId: fbDetails["id"] as! String, name: fbDetails["name"] as! String, email: fbDetails["email"] as! String, id: 0)
                        AccountEndpoints.createUser(user: user)
                        cUser.user = user
                    }
                })
            }
        }
        
    }
}
