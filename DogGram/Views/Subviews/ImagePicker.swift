//
//  ImagePicker.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/11/24.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode // every screen in SwiftUI has access to this presentation mode bc it's an environment variable
    @Binding var imageSelected: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        picker.allowsEditing = true // after you pick an image gives you the option to edit the image
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {}
    
    func makeCoordinator() -> ImagePickerCoordinator { // SwiftUI views don't directly conform to UIKit delegate protocols, so a coordinator is used to handle callbacks and events from UIKit components.
        return ImagePickerCoordinator(parent: self)
    }
    
    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // when a user selects an image using a UIImagePickerController, the coordinator can pass the selected image back to the SwiftUI view model or view
            
            if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage { // first try to get edited image and cast that as a UI Image, if we can't get an edited image, try to get the original image and cast that as a UI Image
                parent.imageSelected = image
                parent.presentationMode.wrappedValue.dismiss() // logic for pressing back on a screen
            }
        }
    }
    
}
