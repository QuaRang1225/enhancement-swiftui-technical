//
//  ProfileImageView.swift
//  TechnicalUI
//
//  Created by 유영웅 on 7/16/24.
//

import SwiftUI

struct ProfileImageView: View {
    @State var show = false
    @State var image:UIImage?
    var body: some View {
        VStack{
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 300, height: 300)
            }
            Button {
                show = true
            } label: {
                Text("사진 선택")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
            }
            .cropImagePicker(show: $show, croppedImage: $image)
        }
       
    }
}

#Preview {
    ProfileImageView()
}
