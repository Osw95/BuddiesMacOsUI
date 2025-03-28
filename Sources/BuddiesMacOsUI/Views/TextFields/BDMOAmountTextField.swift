//
//  BDMOAmountTextField.swift
//  BuddiesMacOsUI
//
//   Created by Javier Cruz Santiago on 09/01/25.
//

public struct BDMOAmountTextField: View {
    @Binding public var strText: String
    private var strTextLabel: String
    private var strPrompt: String
    @FocusState var bIsFocused: Bool
    
    public init(strText: Binding<String>, strTextLabel: String, strPrompt: String = "$0.00") {
        _strText = strText
        self.strTextLabel = strTextLabel
        self.strPrompt = strPrompt
    }
    
    public var body: some View {
        HStack(spacing: .zero) {
            Text(strTextLabel)
                .font(.headline)
            TextField("", text: $strText , prompt: Text(strPrompt))
                .onChange(of: strText) { oldValue, newValue in
                    if !bIsFocused {
                        strText = newValue.localizedCurrencyFormatted() ?? ""
                    }
                }
                .background(bIsFocused ? .white.opacity(1) : .white.opacity(0.0))
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(bIsFocused ? Color.blue : Color.gray.opacity(0), lineWidth: 1.5))
                .focused($bIsFocused)
                .animation(.easeInOut(duration: 0.2), value: bIsFocused)
                .modifier(GeneralCurrencyTextFieldModifier())
                .autocorrectionDisabled()
        }
    }
}
