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
    @FocusState private var bIsFocused: Bool
    
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
                .padding(.vertical, 3)
                .padding(.horizontal, 8)
                .background(bIsFocused ? .white.opacity(1) : .white.opacity(0.0))
                .clipShape(.rect(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(bIsFocused ? Color.blue : Color.gray.opacity(0), lineWidth: 1.5))
                .focused($bIsFocused)
                .animation(.easeInOut(duration: 0.2), value: bIsFocused)
                .onChange(of: bIsFocused) { oldValue, newValue in
                    strText = strText.localizedCurrencyFormatted() ?? "-"
                }
                .autocorrectionDisabled()
                .formatedTextField()
        }
    }
}
