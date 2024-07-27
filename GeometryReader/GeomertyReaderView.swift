//
//  GeomertyReaderView.swift
//  TechnicalUI
//
//  Created by 유영웅 on 7/24/24.
//

import SwiftUI

struct GeomertyReaderView: View {
    
    var body: some View {
        ZStack{
            VStack(spacing:0){
                Circle()
                    .frame(width: 100,height: 100)
                GeometryReader{ geometry in
                    let globalFrame = geometry.frame(in: .global)
                    let localFrame = geometry.frame(in: .local)
                    let nameFrame = geometry.frame(in: .named("GEO"))
                    VStack(alignment:.leading){
                        Text("글로벌 : \(globalFrame.midX) \(globalFrame.minY)")
                        Text("로컬 : \(localFrame.midX) \(localFrame.minY)")
                        Text("네임 : \(nameFrame.midX) \(nameFrame.minY)")
                        Text("디바이스 : \(mainWidth) \(mainHeight)")
                    }
                }
            }
        }
        .coordinateSpace(name: "GEO")
    }
}

#Preview {
    GeomertyReaderView()
}



