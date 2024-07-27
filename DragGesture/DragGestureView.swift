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
    
    @State var currentAngle:Angle = .zero
    @State var endAngle:Angle = .zero
    
    @GestureState var long = false
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: mainWidth + (long ? 20 : 0),height: mainWidth + (long ? 20 : 0))
                .scaleEffect(currentScale + 1)
                .rotationEffect(currentAngle)
                .offset(currentOffset)
//                .gesture(drag)
//                .gesture(pinch)
//                .gesture(rotation)
                .gesture(longProgess)
                .foregroundColor(long ? .red : .pink)
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
                currentScale = gesture + endScale - 1
            }
            .onEnded { gesture in
                endScale = endScale + gesture - 1
            }
            
    }
    var rotation:some Gesture{
        RotationGesture()
            .onChanged { gesture in
                currentAngle = gesture + endAngle
            }
            .onEnded { gesture in
                endAngle = endAngle + gesture
            }
    }
    var longProgess:some Gesture{
        LongPressGesture(minimumDuration: 1,maximumDistance: 1)
            .updating($long) { value, gesture, _ in
                gesture = value
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
