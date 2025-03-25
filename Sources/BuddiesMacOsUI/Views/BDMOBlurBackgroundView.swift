//
//  BDMOBlurView.swift
//  BuddiesMacOsUI
//
//  Created by Javier Cruz Santiago on 05/01/25.
//

import SwiftUI

public struct BDMOBlurBackgroundView<Content: View>: View {
    var customBody: () -> Content
    
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
