//
//  StickyView.swift
//  TechnicalUI
//
//  Created by 유영웅 on 7/27/24.
//

import SwiftUI

struct StickyView: View {
    var body: some View {
        GeometryReader{ geo in
            let minY = geo.frame(in: .global).minY
            Image("icon")
                .resizable()
                .offset(x:minY > 0 ? -minY/2 : 0,
                        y:minY > 0 ? -minY : 0)
                .frame(width: mainWidth + (minY > 0 ? minY : 0),
                       height: mainHeight/2 + (minY > 0 ? minY: 0))
        }
        .padding(.bottom,mainHeight/2 - 15)
    }
}

struct StickyTestView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                StickyView()
                Text("\(mainWidth)")
            }
        }
    }
}
#Preview {
    StickyTestView()
}
