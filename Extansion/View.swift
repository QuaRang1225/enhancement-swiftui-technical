//
//  View.swift
//  TechnicalUI
//
//  Created by 유영웅 on 7/16/24.
//

import Foundation
import SwiftUI

extension View{
    @ViewBuilder
    func cropImagePicker(show:Binding<Bool>,croppedImage:Binding<UIImage?>)->some View{
        CustomImagePicker(show: show, croppedImage: croppedImage) {
            self
        }
    }
    
    @ViewBuilder
    func frame(_ size:CGSize)-> some View{
        self
            .frame(width:size.width,height: size.height)
    }
    var mainWidth:CGFloat{
        UIScreen.main.bounds.width
    }
    var mainHeight:CGFloat{
        UIScreen.main.bounds.height
    }
    func isPad()->Bool{
        UIDevice.current.userInterfaceIdiom == .pad
    }
    func haptics(_ style:UIImpactFeedbackGenerator.FeedbackStyle){
        UIImpactFeedbackGenerator(style: style).impactOccurred()
    }
}
