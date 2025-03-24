//
//  BDMOViewModifierExtension.swift
//  BuddiesMacOsUI
//
//  Created by Oswaldo Ferral Mejia on 23/03/25.
//

import SwiftUI

public extension View {
    
    func adaptiveSizeMacOSWindow() -> some View {
        self.modifier(DefaultWindowMacOSModifier())
    }
    
    func adaptiveSize() -> some View {
        self.modifier(GeneralViewSizeModifier())
    }
    
    func adaptiveWidthSize() -> some View {
        self.modifier(GeneralViewWidthLeadSizeModifier())
    }
    
    func adaptiveSizeMinsMod(minWidth: CGFloat = 150, minHeight: CGFloat = 150) -> some View {
        self.modifier(GeneralViewSizeMinsModifier(minWidth: minWidth, minHeight: minHeight))
    }
}
