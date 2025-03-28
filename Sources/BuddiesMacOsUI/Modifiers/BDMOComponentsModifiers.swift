//
//  BDMOComponentsModifiers.swift
//  BuddiesMacOsUI
//
//  Created by Oswaldo Ferral Mejia on 26/03/25.
//

// - MARK: TextField Modifiers

struct GeneralTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        @FocusState var bIsFocused: Bool
        content
            .padding(.vertical, 3)
            .padding(.horizontal, 8)
            .background(bIsFocused ? .white.opacity(1) : .white.opacity(0.0))
            .textFieldStyle(.plain)
            .multilineTextAlignment(.trailing)
            .clipShape(.rect(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(bIsFocused ? Color.blue : Color.gray.opacity(0), lineWidth: 1.5))
            .focused($bIsFocused)
            .animation(.easeInOut(duration: 0.2), value: bIsFocused)
            .padding(.all, 5)
    }
}


// - MARK: General Image Modifiers



