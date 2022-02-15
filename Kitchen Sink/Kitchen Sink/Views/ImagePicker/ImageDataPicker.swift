//
//  ImageDataPicker.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/15/22.
//

import SwiftUI

enum ImageDataPickerError: Error {
    case InvalidMediaSelection
}

struct ImageDataPicker: UIViewControllerRepresentable {
    @Binding var imageData: Data
    let onError: (_ error: Error) -> Void
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        typealias IKey = UIImagePickerController.InfoKey
        
        let imgPicker: ImageDataPicker
        
        init(picker: ImageDataPicker) {
            self.imgPicker = picker
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                 didFinishPickingMediaWithInfo info: [IKey:Any]) {
            guard let img = info[.editedImage] as? UIImage else {
                picker.dismiss(animated: true)
                return
            }
            
            if let imgData = img.jpegData(compressionQuality: 0.25) {
                imgPicker.imageData = imgData
            } else {
                imgPicker.onError(ImageDataPickerError.InvalidMediaSelection)
            }
            
            picker.dismiss(animated: true)
        }
    }
}
