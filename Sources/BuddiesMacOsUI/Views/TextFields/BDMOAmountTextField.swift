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
                    strText = newValue.localizedCurrencyFormatted() ?? ""
                }
                .customTextfield()
                .autocorrectionDisabled()
        }
    }
}
