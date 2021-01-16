//
//  Map.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var search: String = ""
    @Binding var show : Bool
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 49.2827,
            longitude: -123.1162
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1
        )
    )

    var body: some View {
        ZStack {
            VStack {
                if !show {
                    HStack {
                        Text("Explore")
                            .foregroundColor(Color(hex: "#3E6E79"))
                            .font(.title3)

                        Spacer()
                    }.padding(.top, 20)
                }
                Map(coordinateRegion: $region)
            }
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .padding(.horizontal, show ? 0 : 20)
            .background(Rectangle()
            .fill(Color.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .shadow(radius: 8))
            if show {
                VStack {
                    HStack {
                        Button(action: {
                            show.toggle()
                        }) {
                            Image(systemName: "chevron.left")
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        Spacer()
                    }.padding([.leading, .top], 20)
                    SearchBar(text: $search)
                        .padding(.horizontal,20)
                        .padding(.top, 20)
                    Spacer()
                }
            }
        }.animation(.easeIn(duration: 0.5))
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
