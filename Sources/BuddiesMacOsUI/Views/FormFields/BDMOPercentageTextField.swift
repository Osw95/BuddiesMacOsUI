//
//  BDMOPercentageTextField.swift
//  BuddiesMacOsUI
//
//  Created by Oswaldo Ferral Mejia on 28/03/25.
//

public struct BDMOPercentageTextField: View {
    @Binding var strText: String
    private var strTextLabel: String
    private var strPrompt: String = (try? Double(0.0).percentFormat()) ?? "-"
    @FocusState private var bIsFocused: Bool
    
    public init(strText: Binding<String>, strTextLabel: String, strPrompt: String) {
        _strText = strText
        self.strTextLabel = strTextLabel
        self.strPrompt = strPrompt
    }
    
    public var body: some View {
        HStack{
            Text(strTextLabel)
                .font(.headline)
            TextField("", text: $strText , prompt: Text(strPrompt))
                .background(bIsFocused ? .white.opacity(1) : .white.opacity(0.0))
                .clipShape(.rect(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(bIsFocused ? Color.blue : Color.gray.opacity(0), lineWidth: 1.5))
                .focused($bIsFocused)
                .animation(.easeInOut(duration: 0.2), value: bIsFocused)
                .onChange(of: bIsFocused) { oldValue, newValue in
                    strText = strText.localizedPercentageFormatted()
                }
                .autocorrectionDisabled()
                .formatedTextField()
            
        }
    }
}
#Preview {
    BDMOPercentageTextField(strText: .constant(""), strTextLabel: "Datos", strPrompt: "00")
}
