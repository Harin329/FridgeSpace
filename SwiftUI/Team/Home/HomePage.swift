//
//  HomePage.swift
//  Team
//
//  Created by Victor Uemura on 2021-01-15.
//

import SwiftUI

struct HomePage : View {
    
    @Binding var x : CGFloat
    @Binding var showing: Int
    @State var showMap = false
    @State var showCaptureImageView: Bool = false
    @State var image: Image?
    var body: some View{
        // Home View With CUstom Nav bar...
        if (showCaptureImageView) {
            CaptureImageView(isShown: $showCaptureImageView, image: $image)
        } else {
            VStack{
                ZStack {
                    VStack {
                        HStack{
                            Button(action: {
                                // opening menu,...
                                withAnimation{
                                    x = 0
                                }
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                    .padding(.leading, 20)
                            }
                            Spacer(minLength: 0)
                            Button(action: {
                                self.showCaptureImageView.toggle()
                            }) {
                                Image(systemName: "camera")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                    .padding(.trailing, 20)
                            }
                        }
                        .padding(.top, 40)
                        .padding(.bottom, 10)
                        Spacer()
                    }
                    .opacity(showMap ? 0 : 1)
                    .zIndex(1)
                    if showing == 0 {
                        Landing(show: $showMap)
                    }
                    else if showing == 1 {
                        Resources()
                    }
                }
            }
            // for drag gesture...
            .contentShape(Rectangle())
            .background(Color.white)
        }
    }
}

struct CaptureImageView {
    
    /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
    
}
