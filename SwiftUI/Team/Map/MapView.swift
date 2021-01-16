//
//  Map.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 10,
            longitudeDelta: 10
        )
    )

    var body: some View {
        VStack {
            HStack {
                Text("Explore")
                Spacer()
            }.padding(.top, 10)
            Map(coordinateRegion: $region)
        }
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .padding()
        .background(Rectangle()
                        .fill(Color.white)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                        .shadow(radius: 8))
        
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
