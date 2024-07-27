//
//  DragGesture.swift
//  TechnicalUI
//
//  Created by 유영웅 on 7/27/24.
//

import SwiftUI

struct DragGestureView: View {
    @State var endOffset = CGSize.zero
    @State var currentOffset = CGSize.zero
    
    @State var currentScale:CGFloat = 0
    @State var endScale:CGFloat = 0
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: mainWidth,height: mainWidth)
                .scaleEffect(currentScale + 1)
                .offset(currentOffset)
                .gesture(drag)
                .gesture(pinch)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
    var drag:some Gesture{
        DragGesture()
            .onChanged{ gesture in
                currentOffset = endOffset + gesture.translation
            }
            .onEnded{ gesture in
                endOffset = gesture.translation + endOffset
            }
    }
    var pinch:some Gesture{
        MagnificationGesture()
            .onChanged { gesture in
                print(gesture)
                currentScale = gesture + endScale - 1
            }
            .onEnded { gesture in
                endScale = endScale + gesture - 1
            }
            
    }
}

#Preview {
    DragGestureView()
}
extension CGSize {
  static func + (lhs: Self, rhs: Self) -> Self {
    CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
  }
}
