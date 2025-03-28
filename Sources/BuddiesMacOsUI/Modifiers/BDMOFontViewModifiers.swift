//
//  BDMOFontViewModifiers.swift
//  BuddiesMacOsUI
//
//  Created by Oswaldo Ferral Mejia on 23/03/25.
//

struct TitleFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontDesign(.rounded)
            .bold()
            .padding(.vertical, 10)
    }
}

struct SubTitleFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .fontWeight(.semibold)
            .fontDesign(.rounded)
    }
}

struct BaseBodyFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .fontWeight(.regular)
            .fontDesign(.rounded)
    }
}

struct SMFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .fontWeight(.light)
            .fontDesign(.rounded)
    }
}
