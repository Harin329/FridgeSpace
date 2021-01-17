//
//  Cart.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-16.
//

import SwiftUI

struct PreCart: View {
    @Binding var cart:[Item]
    @Binding var showCaptureImageView: Bool
    @State var added = false
    var item:Item
    var body: some View {
        NavigationView {
            VStack{
                Text("My Surplus Food")
                    .font(.title3)
                    .foregroundColor(Color(hex: "255359"))
                    .padding(.bottom, 30)
                CartItem(item: item)
                    .background(Rectangle()
                                    .fill(Color.white)
                                    .shadow(radius: 2))
                Spacer()
                Button(action: {
                    cart.append(item)
                    added = true
                }) {
                    HStack {
                        Text("Add to Cart")
                            .foregroundColor(Color(hex: "#fff"))
                            .padding([.vertical],15)
                            .frame(width:200)
                    }.background(Color(hex: added ? "9CC3AC" : "#255359"))
                }.cornerRadius(30).padding([.top], 15)
                .disabled(added)
                Button(action: {
                    showCaptureImageView = true
                }) {
                    HStack {
                        Text("Add more")
                            .foregroundColor(Color(hex: "#fff"))
                            .padding([.vertical],15)
                            .frame(width:200)
                    }.background(Color(hex: "#255359"))
                }.cornerRadius(30).padding([.bottom,.top], 15)
                NavigationLink(destination: Cart(cart: $cart)) {
                    HStack {
                        Text("Go to Cart")
                            .foregroundColor(Color(hex: "#fff"))
                            .padding([.vertical],15)
                            .frame(width:200)
                    }.background(Color(hex: "#255359"))
                }.cornerRadius(30).padding([.bottom], 15)
            }.padding(.vertical,40).padding(.top,15)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }.accentColor( Color(hex: "#255359"))
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

struct Cart: View {
    @Binding var cart:[Item]
    var body: some View {
        VStack{
            Text("My Surplus Food")
                .font(.title3)
                .foregroundColor(Color(hex: "255359"))
                .padding(.bottom, 30)
            ForEach(0..<4) { number in //yuck xD
                if number < cart.count {
                    CartItem(item: cart[number])
                        .background(Rectangle()
                                        .fill(Color.white)
                                        .shadow(radius: 2))
                }
            }
            Spacer()
            Button(action: {
            }) {
                HStack {
                    Text("Pack it Up")
                        .foregroundColor(Color(hex: "#fff"))
                        .padding([.vertical],15)
                        .frame(width:200)
                }.background(Color(hex: "#255359"))
            }.cornerRadius(30).padding([.bottom,.top], 15)
        }
        .offset(y:-65)
        .padding(.bottom,40)
        .navigationBarTitle("")
    }
}

struct CartItem: View {
    @State var quantity = 1
    var item: Item
    var body: some View {
        HStack {
            item.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
                .frame(width: 80, height: 80)
                .padding(.trailing,20)
            VStack {
                HStack {
                    Text(item.name)
                        .font(.body)
                        .foregroundColor(Color(hex: "255359"))
                    Spacer()
                }.padding(.bottom, 5)
                HStack {
                    HStack {
                        Button(action: {
                            if quantity != 0 {
                                quantity = quantity - 1
                            }
                        }) {
                            Image(systemName: "minus")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                                .background(Rectangle()
                                                .fill(Color(hex:"9CC3AC"))
                                                .frame(width:30, height: 30))
                        }.frame(width:30, height: 30)
                        Text(String(quantity))
                            .frame(width:20, height: 20)
                        Button(action: {
                            quantity = quantity + 1
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                                .background(Rectangle()
                                                .fill(Color(hex:"9CC3AC"))
                                                .frame(width:30, height: 30))
                        }.frame(width:30, height: 30)
                    }.background(Rectangle()
                                    .fill(Color.white)
                                .shadow(radius: 2))
                    Spacer()
                }
            }
            Spacer()
            Image("pencil")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
        }.padding()
    }
}



struct Item: Identifiable {
    let id = UUID()
    let name: String
    let image: Image

}
