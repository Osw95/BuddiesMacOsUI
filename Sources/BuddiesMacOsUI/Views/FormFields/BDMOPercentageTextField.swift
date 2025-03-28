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
                .customTextfield()
                .onChange(of: strText) { oldValue, newValue in
                    strText = newValue.localizedPercentageFormatted()
                }
            
        }
    }
}
#Preview {
    BDMOPercentageTextField(strText: .constant(""), strTextLabel: "Datos", strPrompt: "00")
}
