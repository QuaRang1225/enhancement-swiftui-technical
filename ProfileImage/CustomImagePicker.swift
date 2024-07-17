//
//  CustomImagePicker.swift
//  TechnicalUI
//
//  Created by 유영웅 on 7/16/24.
//


import SwiftUI
import PhotosUI


struct CustomImagePicker<Content:View>: View {
    var content:Content
    @Binding var show:Bool
    @Binding var croppedImage:UIImage?
    init(show:Binding<Bool>,croppedImage:Binding<UIImage?>,@ViewBuilder content: @escaping ()->Content) {
        self.content = content()
        self._show = show
        self._croppedImage = croppedImage
    }
    @State var showCropView = false
    @State var photosItem:PhotosPickerItem?
    @State var selected:UIImage?
    var body: some View {
        content
            .photosPicker(isPresented: $show, selection: $photosItem)
            .onChange(of: photosItem) { newValue in
                if let newValue{
                    Task{
                        if let imageData = try? await newValue.loadTransferable(type: Data.self),let image = UIImage(data: imageData){
                            await MainActor.run {
                                self.selected = image
                                showCropView.toggle()
                            }
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $showCropView){
                selected = nil
                photosItem = nil
            } content: {
                CropView(image: $selected){ croppedImage, status in
                    if let croppedImage{
                        self.croppedImage = croppedImage
                    }
                }
            }
    }
}
