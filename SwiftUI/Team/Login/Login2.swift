//
//  Login2.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-16.
//

import SwiftUI
import FBSDKLoginKit

struct Login2: View {
    @ObservedObject var fbmanager = UserLoginManager()
    var body: some View {
        Button(action: {
            self.fbmanager.facebookLogin()
        }) {
            Text("Continue with Facebook")
        }
    }
}

class UserLoginManager: ObservableObject {
    let loginManager = LoginManager()
    func facebookLogin() {
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
                        AccountEndpoints.createUser(user: User(facebookId: fbDetails["id"] as! String, name: fbDetails["name"] as! String, email: fbDetails["email"] as! String))
                        print(fbDetails["email"])
                        print(fbDetails["name"])
                        print(fbDetails["id"])
                    }
                })
            }
        }
    }
}

struct Login2_Previews: PreviewProvider {
    static var previews: some View {
        Login2()
    }
}
