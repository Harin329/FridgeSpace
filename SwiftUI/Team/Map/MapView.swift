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
    @State var showDetails = false
    @State var y: CGFloat = .zero
    @State var details = Place(name: "", rating: 4, description: "", latitude: 49.282168337943865, longitude: -123.10198987525719)
    let places = [
        Place(name: "Downtown Eastside Women’s Centre", rating: 4, description: "Women’s shelter • 302 Columbia St", latitude: 49.282168337943865, longitude: -123.10198987525719)
    ]
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
                Map(coordinateRegion: $region,annotationItems: places) { place in
                    MapAnnotation(coordinate: place.coordinate) {
                        Button(action: {
                            showDetails = true
                            details = place
                        }, label: {
                            Image("pin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 55, height: 55, alignment: .center)
                        })
                        }

                }
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
                            showDetails = false
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
            if showDetails {
                DetailedCard(place: details, showDetails: $showDetails, y: $y)
                    .offset(y: showDetails ? UIScreen.main.bounds.height / 3 + y : UIScreen.main.bounds.height)
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

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let rating: Int
    let description: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

