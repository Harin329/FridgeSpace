//
//  FollowView.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct Stats : View {
    
    var count : Int
    var title : String
    
    var body: some View{
    
        HStack{
            
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.gray)
        }
    }
}

//struct FollowView_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowView()
//    }
//}
