//
//  CropImageView.swift
//  TechnicalUI
//
//  Created by 유영웅 on 7/27/24.
//

import SwiftUI

struct CropImageView: View {
    @State var endOffset = CGSize.zero
    @State var currentOffset = CGSize.zero
    
    @State var currentScale:CGFloat = 0
    @State var endScale:CGFloat = 0
    
    @State var appearGrid = false
    @GestureState var changed = false
    var body: some View {
        ZStack{
            Color.black.opacity(0.7).ignoresSafeArea()
            GeometryReader{ geo in
                let g = geo.frame(in: .named("G"))
                Image("icon")
                    .resizable()
                    .frame(maxHeight: .infinity)
                    .onChange(of: changed) { change in
                        withAnimation(.easeIn(duration: 0.1)){
                            if g.minX > 0{
                                currentOffset.width = currentOffset.width - g.minX
                            }
                            if g.minY > 0{
                                currentOffset.height = currentOffset.height - g.minY
                            }
                            if g.maxX < mainWidth{
                                currentOffset.width = g.minX - currentOffset.width
                            }
                            if g.maxY < mainWidth{
                                currentOffset.height = g.minY - currentOffset.height
                            }
                            if !change{
                                endOffset = currentOffset
                            }
                            withAnimation(.easeInOut(duration: 0.5)){
                                appearGrid.toggle()
                            }
                        }
                    }
            }
            .scaleEffect(currentScale + 1)
            .offset(currentOffset)
            .gesture(drag)
            .gesture(pinch)
            .frame(width: mainWidth,height: mainWidth)
            .coordinateSpace(name: "G")
            .mask{
                ZStack {
                    Rectangle()
                        .opacity(0.5)
                    Circle()
                }
            }
            .overlay {
                if appearGrid{
                    Grids()
                }
            }
            
        }
        
    }
    var drag:some Gesture{
        DragGesture()
            .updating($changed){ _,changed,_ in
                changed = true
            }
            .onChanged{ gesture in
                currentOffset = endOffset + gesture.translation
            }
    }
    var pinch:some Gesture{
        MagnificationGesture()
            .updating($changed){ _,changed,_ in
                changed = true
            }
            .onChanged { gesture in
                currentScale = gesture + endScale - 1
            }
            .onEnded { gesture in
                withAnimation(.easeIn(duration: 0.1)){
                    endScale = endScale + gesture - 1
                    if endScale + 1 < 1 || endScale + 1 > 3{
                        currentScale = 0
                        endScale = 0
                    }
                }
            }
            
    }
    @ViewBuilder
    func Grids()->some View{
        ZStack{
            HStack{
                ForEach(1...4,id: \.self){ _ in
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 1)
                        .frame(maxWidth:.infinity)
                    
                }
            }
            VStack{
                ForEach(1...4,id: \.self){ _ in
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 1)
                        .frame(maxHeight:.infinity)
                    
                }
            }
        }
    }
}

#Preview {
    CropImageView()
}
