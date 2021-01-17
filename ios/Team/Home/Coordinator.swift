//
//  Coordinator.swift
//  Team
//
//  Created by Harin Wu on 2021-01-15.
//

import SwiftUI
import CoreML
import Vision

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var isCoordinatorShown: Bool
    @Binding var imageInCoordinator: Image?
    @Binding var cartShown: Bool
    @Binding var prediction: String
    init(isShown: Binding<Bool>, image: Binding<Image?>, cartShown: Binding<Bool>, prediction: Binding<String>) {
        _isCoordinatorShown = isShown
        _imageInCoordinator = image
        _cartShown = cartShown
        _prediction = prediction
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageInCoordinator = Image(uiImage: unwrapImage)
        
        
        guard let cgImg =  CIImage(image: unwrapImage) else {
                fatalError("can't convert image")
            }
        
        guard let model = try? VNCoreMLModel(for: Resnet50().model)
            else{
                fatalError("Erro acessando modelo")
            }
        let request = VNCoreMLRequest(model: model) { [self](request, error) in
           
                guard let results = request.results as?
                                              [VNClassificationObservation]
                else{
                    fatalError()
                }
                
            print(results)
                // Make Prediction
                prediction = results[0].identifier
             }
             let handler = VNImageRequestHandler(ciImage: cgImg)
             do{
                try handler.perform([request])
             }catch{
                print(error)
             }
        
        
        
        isCoordinatorShown = false
        cartShown = true
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isCoordinatorShown = false
    }
}
