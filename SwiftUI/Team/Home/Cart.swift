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
    @Binding var showing: Int
    @Binding var showCartView: Bool
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Button(action: {
                            showing = 0
                            showCartView.toggle()
                        }) {
                            Image(systemName: "chevron.left")
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        Spacer()
                    }.padding([.leading, .top], 20)
                    Spacer()
                }
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
                    HStack {
                        Button(action: {
                            showCaptureImageView = true
                        }) {
                            HStack {
                                Text("Add more")
                                    .foregroundColor(Color(hex: "#fff"))
                                    .padding([.vertical],15)
                                    .frame(width:160)
                            }.background(Color(hex: "#255359"))
                        }.cornerRadius(30).padding([.leading], 15)
                        
                        NavigationLink(destination: Cart(cart: $cart, showing: $showing, showCartView: $showCartView)) {
                            HStack {
                                Text("Go to Cart")
                                    .foregroundColor(Color(hex: "#fff"))
                                    .padding([.vertical],15)
                                    .frame(width:160)
                            }.background(Color(hex: "#255359"))
                        }.cornerRadius(30).padding([.trailing], 15)
                    }.padding([.bottom], 15)
                    Button(action: {
                        cart.append(item)
                        added = true
                    }) {
                        HStack {
                            Text(added ? "Added!" : "Add to Cart")
                                .foregroundColor(Color(hex: "#fff"))
                                .padding([.vertical],15)
                                .frame(width:320)
                        }.background(Color(hex: added ? "9CC3AC" : "#255359"))
                    }.cornerRadius(30).padding([.bottom], 15)
                    .disabled(added)


                }.padding(.vertical,40).padding(.top,15)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }.accentColor( Color(hex: "#255359"))
        }
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
    @Binding var showing: Int
    @Binding var showCartView: Bool
    @State var showThanks = false
    var body: some View {
        ZStack {
            ThankYou(showing: $showing, showCartView: $showCartView, showThanks: $showThanks)
                .opacity(showThanks ? 1 : 0)
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
                    showThanks.toggle()
                }) {
                    HStack {
                        Text("Pack it Up")
                            .foregroundColor(Color(hex: "#fff"))
                            .padding([.vertical],15)
                            .frame(width:200)
                    }.background(Color(hex: "#255359"))
                }.cornerRadius(30).padding([.bottom,.top], 15)
            }
            .padding(.bottom,40)
            .navigationBarTitle("")
            .accentColor( Color(hex: "#255359"))
            .opacity(showThanks ? 0 : 1)
        }.offset(y:0)

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

struct ThankYou: View {
    @Binding var showing: Int
    @Binding var showCartView: Bool
    @Binding var showThanks: Bool

    var body: some View {
            VStack{
                Text("Thank you!")
                    .font(.title)
                    .foregroundColor(Color(hex: "255359"))
                    .padding(.bottom, 30)
                Spacer()
                Image("onboarding3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350)
                Spacer()
                Button(action: {
                    showing = 0
                    showCartView.toggle()
                }) {
                    HStack {
                        Text("Return to Home")
                            .foregroundColor(Color(hex: "#fff"))
                            .padding([.vertical],15)
                            .frame(width:320)
                    }.background(Color(hex:"#255359"))
                }.cornerRadius(30).padding([.bottom], 15)

            }.padding(.vertical,40).padding(.top,15)
            .offset(y:0)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
}

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let image: Image

}
