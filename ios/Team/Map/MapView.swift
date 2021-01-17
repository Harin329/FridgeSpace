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
    @Binding var disableMenu : Bool
    @State var showDetails = false
    @State var y: CGFloat = .zero
    @Binding var showCaptureImageView: Bool
    @State var details = Place(name: "", rating: 4, description: "", latitude: 49.282168337943865, longitude: -123.10198987525719)
    let places = [
        Place(name: "Downtown Eastside Women’s Centre", rating: 4, description: "Women’s shelter • 302 Columbia St", latitude: 49.282168337943865, longitude: -123.10198987525719),
        Place(name: "Quest Food Exchange", rating: 5, description: "Food bank • 167 1st St E", latitude: 49.310707552051326, longitude: -123.07688379426315),
        Place(name: "The Salvation Army", rating: 4, description: "Soup kitchen • 105 12th St W", latitude: 49.31872950930746, longitude: -123.07275778056395),
        Place(name: "The Dugout", rating: 5, description: "Non-profit organization • 59 Powell St", latitude: 49.283452702488425, longitude: -123.10267433159707),
        Place(name: "The Door Is Open", rating: 5, description: "Soup kitchen • 255 Dunlevy Ave", latitude: 49.2825696333637, longitude: -123.09556808256683),
        Place(name: "Downtown Eastside Women’s Centre", rating: 4, description: "Women’s shelter • 302 Columbia St", latitude: 49.320971276368454, longitude: -123.09565816407556),
        Place(name: "Quest Food Exchange", rating: 5, description: "Food bank • 167 1st St E", latitude: 49.272745732090236, longitude: -123.06807362740749),
        Place(name: "The Salvation Army", rating: 4, description: "Soup kitchen • 105 12th St W", latitude: 49.276466653590916, longitude: -123.0986631712335),
        Place(name: "The Dugout", rating: 5, description: "Non-profit organization • 59 Powell St", latitude: 49.26476171691881, longitude: -123.08715320730334),
        Place(name: "The Door Is Open", rating: 5, description: "Soup kitchen • 255 Dunlevy Ave", latitude: 49.284381134681844, longitude: -123.06454805288277),
        Place(name: "The Salvation Army", rating: 4, description: "Soup kitchen • 105 12th St W", latitude: 49.331288171067925, longitude: -123.10883624966553),
        Place(name: "The Dugout", rating: 5, description: "Non-profit organization • 59 Powell St", latitude: 49.31711641600455, longitude: -123.1125164495634)
    ]
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 49.2994117016012,
            longitude: -123.0910624969814
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05
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
                            disableMenu.toggle()
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
                DetailedCard(place: details, showDetails: $showDetails, y: $y, showCaptureImageView: $showCaptureImageView)
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

