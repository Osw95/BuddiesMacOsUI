//
//  BDMOViewModifierExtension.swift
//  BuddiesMacOsUI
//
//  Created by Oswaldo Ferral Mejia on 23/03/25.
//

import SwiftUI

public extension View {
    
    // - MARK: View - Window
    func adaptiveSizeMacOSWindow() -> some View {
        self.modifier(DefaultWindowMacOSModifier())
    }
    
    func adaptiveSheetMacOsWindow() -> some View {
        self.modifier(ModalWindowMacOSModifier())
    }
    
    func adaptiveSize() -> some View {
        self.modifier(GeneralViewSizePaddingModifier())
    }
    
    func adaptiveSizeNoPD() -> some View {
        self.modifier(GeneralViewSizeModifier())
    }
    
    func adaptiveWorkSize() -> some View {
        self.modifier(GeneralWorkViewSizeModifier())
    }
    
    func adaptiveWidthSize() -> some View {
        self.modifier(GeneralViewWidthLeadSizeModifier())
    }
    
    func adaptiveSizeMinsMod(minWidth: CGFloat = 150, minHeight: CGFloat = 150) -> some View {
        self.modifier(GeneralViewSizeMinsModifier(minWidth: minWidth, minHeight: minHeight))
    }
    
    // - MARK: TextField Modifiers
    func customTextfield() -> some View {
        self.modifier(GeneralTextFieldModifier())
    }
}
