//
//  BDMOFCustomViewModifiers.swift
//  BuddiesMacOsUI
//
//  Created by Oswaldo Ferral Mejia on 23/03/25.
//

import SwiftUI

// - MARK: View - Window
struct DefaultWindowMacOSModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(
                minWidth: 850,
                idealWidth: 1000,
                maxWidth: .infinity,
                minHeight: 530,
                idealHeight: 600,
                maxHeight: .infinity)
            .background(.ultraThinMaterial)
            .blur(radius: 10)
    }
}


struct GeneralWorkViewSizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.background)
    }
}

struct GeneralViewSizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.ultraThinMaterial)
            .blur(radius: 10)
    }
}

struct GeneralViewWidthLeadSizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GeneralViewSizeMinsModifier: ViewModifier {
    var minWidth: CGFloat?
    var minHeight: CGFloat?
    func body(content: Content) -> some View {
        content
            .frame(minWidth: minWidth,
                   maxWidth: .infinity,
                   minHeight: minHeight,
                   maxHeight: .infinity)
    }
}

// - MARK: TextField Modifiers
struct GeneralTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .multilineTextAlignment(.center)
            .padding()
    }
}
