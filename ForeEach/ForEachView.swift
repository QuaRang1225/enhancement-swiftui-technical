//
//  ForEach.swift
//  TechnicalUI
//
//  Created by 유영웅 on 7/16/24.
//

import SwiftUI

struct ForEachView: View {
    var body: some View {
        RainbowTextForEach{
//                VStack{
//                    Text("안녕하세요")
//                    RoundedRectangle(cornerRadius: 10)
//                }
            VStack{
                hello
            }
        }
    }
    @ViewBuilder
    var hello: some View {
        Text("안녕")
        Text("안녕")
        Text("안녕")
        Text("안녕")
        Text("안녕")
        Text("안녕")
    }
}

#Preview {
    ForEachView()
}

struct RainbowTextForEach<Content:View>: View {
    
    let content: () -> Content
    let rainbow:[Color] = [.red,.orange,.yellow,.green,.blue,.indigo,.purple]
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ForEach(rainbow,id: \.self){ color in
            content()
                .foregroundColor(color)
        }
    }
    
}
