//
//  BDMOAmountTextField.swift
//  BuddiesMacOsUI
//
//   Created by Javier Cruz Santiago on 09/01/25.
//

public struct BDMOAmountTextField: View {
    @Binding public var text: String
    public var textLabel: String
    
    public init(text: Binding<String>, textLabel: String = "$0.00") {
        _text = text
        self.textLabel = textLabel
    }
    
    public var body: some View {
        TextField(textLabel, text: $text)
            .onChange(of: text) { oldValue, newValue in
                text = newValue.localizedCurrencyFormatted() ?? "-"
            }
            .customTextfield()
            .autocorrectionDisabled()
    }
}
