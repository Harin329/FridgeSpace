//
//  DetailedCard.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-16.
//

import SwiftUI

struct DetailedCard: View {
    var place: Place
    @Binding var showDetails: Bool
    @Binding var y : CGFloat
    var length: CGFloat = 150.0
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(hex: "C4C4C4"))
                .frame(width: 40, height: 5)
            HStack {
                Image("detailedView")
                VStack {
                    HStack {
                        Text(place.name)
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "255359"))
                        Spacer()
                    }
                    HStack{
                        Text(String(place.rating) + ".0")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "3E6E79"))
                        ForEach(1..<5+1) { number in
                            if number < 5 {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color(hex: "FFC331"))
                                    .padding(-3)
                            }
                            else {
                                Image(systemName: "star")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color(hex: "FFC331"))
                                    .padding(-3)
                            }
                        }
                        Text("(97)")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "3E6E79"))
                        Spacer()
                    }
                    HStack {
                        Text(place.description)
                            .font(.subheadline)

                            .foregroundColor(Color(hex: "3E6E79"))
                        Spacer()
                    }
                }
            }
            HStack {
                Text("See what’s in demand:")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "255359"))
                Spacer()
            }
            HStack {
                Text("Non-perishable")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "fff"))
                    .padding(.vertical, 8)
                    .padding(.horizontal,12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "9CC3AC")))
                Text("Fresh Fruit")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "fff"))
                    .padding(.vertical, 8)
                    .padding(.horizontal,12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "FFC331")))
                Text("Vegetable")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "fff"))
                    .padding(.vertical, 8)
                    .padding(.horizontal,11)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "5590C3")))
            }
            HStack {
                Text("24")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "9CC3AC"))
                Text("households donated here today!")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "255359"))
                Spacer()
            }
            Button(action: {
            }) {
                HStack {
                    Text("Donate")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding([.vertical],15)
                        .frame(width:200)
                }.background(Color(hex: "#255359"))
            }.cornerRadius(30).padding(.top, 5)
        }
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .padding(.horizontal, 20)
        .padding(.top, 10)
        .padding(.bottom, 20)
        .background(Rectangle()
        .fill(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(radius: 8))
        .gesture(DragGesture()
                    .onChanged { gesture in
                        self.y = gesture.translation.height
                    }
                    .onEnded { _ in
                        if y > 100 {
                            showDetails.toggle()
                            self.y = .zero
                        } else {
                            self.y = .zero
                        }
                    })
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
