//
//  BDMODefaultTextfield.swift
//  BuddiesMacOsUI
//
//  Created by Oswaldo Ferral Mejia on 27/03/25.
//

public struct BDMODefaultTextfield: View {
    var strTextLabel: String
    var strTextPrompt: String
    var setContentType: NSTextContentType
    @Binding var strTextValue: String
    
    public init(strTextLabel: String, strTextPrompt: String, strTextValue: Binding<String>, setContentType: NSTextContentType = .name) {
        self.strTextLabel = strTextLabel
        self.strTextPrompt = strTextPrompt
        self.setContentType = setContentType
        _strTextValue = strTextValue
    }
    
    public var body: some View {
        HStack(spacing: .zero) {
            Text(strTextLabel)
                .font(.headline)
            TextField("", text: $strTextValue, prompt: Text(strTextPrompt))
                .customTextfield()
                .textContentType(setContentType)
        }
    }
}
