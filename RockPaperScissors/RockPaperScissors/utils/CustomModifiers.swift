//
//  CustomModifiers.swift
//  RockPaperScissors
//
//  Created by Ewanfo Lucky Peter on 01/07/2022.
//

import SwiftUI

struct TitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.weight(.bold))
            .foregroundColor(.white)
    }
}

extension View{
    
    func titleTextModifier() -> some View{
        modifier(TitleTextModifier())
    }
}

