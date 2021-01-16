//
//  Login.swift
//  Team
//
//  Created by Harin Wu on 2021-01-15.
//

import SwiftUI
import FBSDKLoginKit


struct Login : View {
    // for future use...
    @State var width = UIScreen.main.bounds.width - 90
    // to hide view...
    @State var x = -UIScreen.main.bounds.width + 90
    @State var showing = 0
    // 1: Splash, 2: Sign Up, 3: Login, 4: Forget My Password
    @State var loginState = [1, 2, 3]
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Login").padding()
            }
            Spacer()
            Text("Welcome to")
            Image(systemName: "camera")
                .font(.system(size: 24))
                .foregroundColor(.black)
                .padding(.trailing, 10)
            Button(action: {
                print("Sign Up")
            }) {
                Text("Sign Up")
                    .padding(10.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                            .shadow(color: Color.init(hex: "255359"), radius: 10.0)
                    )
            }
            HStack {
                Text("By continuing, you agree to the Terms of Service and acknowledge the Privacy Policy").padding()
            }
            Spacer()
            
            LoginPage()
        }
    }
}

//struct LoginPageView : View {
//    // for future use...
//    @State var width = UIScreen.main.bounds.width - 90
//    // to hide view...
//    @State var x = -UIScreen.main.bounds.width + 90
//    @State var showing = 0
//    // 1: Splash, 2: Sign Up, 3: Login, 4: Forget My Password
//    @State var loginState = [1, 2, 3]
//    var body: some View {
//        if (loginState == 1) {
//            // Splash
//            VStack {
//                Text("Login")
//                Text("Welcome to")
//                Image(systemName: "camera")
//                    .font(.system(size: 24))
//                    .foregroundColor(.black)
//                    .padding(.trailing, 10)
//                Button(action: {
//                    print("signup")
//                }) {
//                    Text("Sign Up")
//                }
//                Text("By continuing, you agree to the Terms of Service and acknowledge the Privacy Policy")
//            }
//        } else if (loginState == 2) {
//            // Sign Up
//            VStack {
//                Button(action: {
//                    print("back")
//                }) {
//                    Image(systemName: "camera")
//                        .font(.system(size: 24))
//                        .foregroundColor(.black)
//                        .padding(.trailing, 10)
//                }
//                Text("Register")
//                Button(action: {
//                    print("signup")
//                }) {
//                    Text("Sign Up")
//                }
//                LoginPage()
//            }
//        } else if (loginState == 3) {
//            // Login
//            VStack {
//                Button(action: {
//                    print("back")
//                }) {
//                    Image(systemName: "camera")
//                        .font(.system(size: 24))
//                        .foregroundColor(.black)
//                        .padding(.trailing, 10)
//                }
//                Text("Login")
//                Button(action: {
//                    print("login")
//                }) {
//                    Text("Login")
//                }
//                LoginPage()
//            }
//        }
//    }
//}

//struct SignUpPage : View {
//    // for future use...
//    @State var width = UIScreen.main.bounds.width - 90
//    // to hide view...
//    @State var x = -UIScreen.main.bounds.width + 90
//    @State var showing = 0
//    // 1: Splash, 2: Sign Up, 3: Login, 4: Forget My Password
//    @State var loginState = [1, 2, 3]
//    var body: some View {
//        if (loginState == 1) {
//            // Splash
//            VStack {
//                Text("Login")
//                Text("Welcome to")
//                Image(systemName: "camera")
//                    .font(.system(size: 24))
//                    .foregroundColor(.black)
//                    .padding(.trailing, 10)
//                Button(action: {
//                    print("signup")
//                }) {
//                    Text("Sign Up")
//                }
//                Text("By continuing, you agree to the Terms of Service and acknowledge the Privacy Policy")
//            }
//        } else if (loginState == 2) {
//            // Sign Up
//            VStack {
//                Button(action: {
//                    print("back")
//                }) {
//                    Image(systemName: "camera")
//                        .font(.system(size: 24))
//                        .foregroundColor(.black)
//                        .padding(.trailing, 10)
//                }
//                Text("Register")
//                Button(action: {
//                    print("signup")
//                }) {
//                    Text("Sign Up")
//                }
//                LoginPage()
//            }
//        } else if (loginState == 3) {
//            // Login
//            VStack {
//                Button(action: {
//                    print("back")
//                }) {
//                    Image(systemName: "camera")
//                        .font(.system(size: 24))
//                        .foregroundColor(.black)
//                        .padding(.trailing, 10)
//                }
//                Text("Login")
//                Button(action: {
//                    print("login")
//                }) {
//                    Text("Login")
//                }
//                LoginPage()
//            }
//        }
//    }
//}

struct LoginPage: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 50))
        let title = UITextView()
        
        let button = FBLoginButton()
        
        
        title.text = "Welcome to"
        title.textColor = UIColor.black
        button.center = view.center
        view.addSubview(title)
        view.addSubview(button)
        
        return view
    }
    
 
    func updateUIView(_ uiView: UIView, context: Context) {
 
        // Update the view
        if let token = AccessToken.current, !token.isExpired {
            print(token.userID)
        }
    }
}


