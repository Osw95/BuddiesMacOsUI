//
//  BDMOFCustomViewModifiers.swift
//  BuddiesMacOsUI
//
//  Created by Oswaldo Ferral Mejia on 23/03/25.
//

import SwiftUI

struct DefaultWindowMacOSModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(
                minWidth: 800,
                idealWidth: 1000,
                maxWidth: .infinity,
                minHeight: 500,
                idealHeight: 600,
                maxHeight: .infinity)
    }
}


struct GeneralViewSizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
