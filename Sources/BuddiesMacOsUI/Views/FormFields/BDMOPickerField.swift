//
//  BDMOPickerField.swift
//  BuddiesMacOsUI
//
//  Created by Oswaldo Ferral Mejia on 28/03/25.
//

public struct BDMOPickerField <T: Identifiable & Hashable>: View {
    
    private var strTextLabel: String
    private var arrTextTag: [T]
    @Binding var anyBindingValue: T

    public init(strTextLabel: String, anyBindingValue: Binding<T>, arrTextTag: [T]) {
        self.strTextLabel = strTextLabel
        self.arrTextTag = arrTextTag
        _anyBindingValue = anyBindingValue
    }
    
    public var body: some View {
        HStack {
            Text("\(strTextLabel)")
                .font(.headline)
            Spacer()
            Picker("", selection: $anyBindingValue) {
                ForEach(arrTextTag) { item in
                    getTextTagView(item)
                }
            }
            .pickerStyle(.menu)
            .labelsHidden()
            .fixedSize()
        }
    }
    
    @ViewBuilder
    private func getTextTagView(_ item: T) -> some View {
        if let textDisplay = item.id as? String {
            Text(textDisplay).tag(item as T)
        } else {
            Text("No valid value")
        }
       
    }
}
