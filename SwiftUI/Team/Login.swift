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
    var body: some View{
        VStack {
            LoginPage()
        }
    }
}

struct LoginPage: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
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
    }
}


