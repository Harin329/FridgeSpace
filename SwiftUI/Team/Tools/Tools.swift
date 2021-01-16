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
            SearchBar(text: $search, placeholder: "Zip code, food item, nonprofit, etc.")
                .padding(.horizontal,5)
            HStack {
                Text("Tools")
                Spacer()
            }.padding(.horizontal)
            HStack {
                VStack {
                    Button(action: {
                    }) {
                        Image("tool1")
                            .resizable()
                            .frame(width: size, height: size)
                    }
                    Text("See My \nSurplus").font(.footnote)
                        .offset(y:-10)
                        .multilineTextAlignment(.center)
                }
                VStack {
                    Button(action: {
                    }) {
                        Image("tool2")
                            .resizable()
                            .frame(width: size, height: size)
                    }
                    Text("Request \nPackage").font(.footnote)
                        .offset(y:-10)
                        .multilineTextAlignment(.center)
                }
                VStack {
                    Button(action: {
                    }) {
                        Image("tool3")
                            .resizable()
                            .frame(width: size, height: size)
                    }
                    Text("Schedule \nPickup").font(.footnote)
                        .offset(y:-10)
                        .multilineTextAlignment(.center)
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

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
