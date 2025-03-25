//
//  BDMOBlurView.swift
//  BuddiesMacOsUI
//
//  Created by Javier Cruz Santiago on 05/01/25.
//

import SwiftUI

public struct BDMOBlurBackgroundView<Content: View>: View {
    var customBody: () -> Content
    
    public init(customBody: @escaping () -> any View) {
        self.customBody = customBody as! () -> Content
    }
    
    public var body: some View {
        ZStack {
            BDMOBlurView(
                material: .underWindowBackground,
                blendingMode: .behindWindow
            )
            .ignoresSafeArea(.all)
            
            customBody()
        }
    }
}
