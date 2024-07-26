//
//  View.swift
//  TechnicalUI
//
//  Created by 유영웅 on 7/16/24.
//

import Foundation
import SwiftUI

extension View{
    
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
