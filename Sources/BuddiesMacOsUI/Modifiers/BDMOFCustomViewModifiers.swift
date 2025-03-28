//
//  BDMOFCustomViewModifiers.swift
//  BuddiesMacOsUI
//
//  Created by Oswaldo Ferral Mejia on 23/03/25.
//

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
    }
}

struct ModalWindowMacOSModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(
                minWidth: 650,
                maxWidth: 650,
                minHeight: 500,
                maxHeight: 500)
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

struct GeneralViewSizePaddingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.all, 20)
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
