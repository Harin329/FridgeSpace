//
//  Tools.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct Tools: View {
    @State private var search: String = ""
    var size: CGFloat = 110
    var body: some View {
        return VStack {
            SearchBar(text: $search)
                .padding(.horizontal,5)
                .padding(.bottom, 10)
            HStack {
                Text("Tools")
                    .foregroundColor(Color(hex: "#3E6E79"))
                    .font(.title3)
                Spacer()
            }.padding(.horizontal)
            HStack {
                VStack {
                    Button(action: {
                    }) {
                        VStack {
                            Image("tool1")
                                .resizable()
                                .frame(width: size, height: size)
                            Text("See My \nSurplus").font(.footnote)
                                .offset(y:-10)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(hex: "#3E6E79"))
                        }
                    }

                }
                VStack {
                    Button(action: {
                    }) {
                        VStack {
                            Image("tool2")
                                .resizable()
                                .frame(width: size, height: size)
                            Text("Request \nPackage").font(.footnote)
                                .offset(y:-10)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(hex: "#3E6E79"))
                        }
                    }
                }
                VStack {
                    Button(action: {
                    }) {
                        VStack {
                            Image("tool3")
                                .resizable()
                                .frame(width: size, height: size)
                            Text("Schedule \nPickup").font(.footnote)
                                .offset(y:-10)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(hex: "#3E6E79"))
                        }
                    }
                }
            }
        }
    }
}

struct Tools_Previews: PreviewProvider {
    static var previews: some View {
        Tools()
    }
}

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false
        
    var body: some View {
        HStack {
            
            TextField("Zip code, food item, nonprofit", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(hex: "#3E6E79"))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color(hex: "#3E6E79"))
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
