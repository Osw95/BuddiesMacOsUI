//
//  BDMOFontModifierExtension.swift
//  BuddiesMacOsUI
//
//  Created by Oswaldo Ferral Mejia on 23/03/25.
//

import SwiftUI

public extension View {
    
    func titleFont() -> some View {
        self.modifier(TitleFontModifier())
    }
    
    func subtitleFont() -> some View {
        self.modifier(SubTitleFontModifier())
    }
    
    func bodyTextFont() -> some View {
        self.modifier(BaseBodyFontModifier())
    }
    
    func smallBodyTextFont() -> some View {
        self.modifier(SMFontModifier())
    }
    
}
