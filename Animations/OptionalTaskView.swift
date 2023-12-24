//
//  OptionalTaskView.swift
//  Animations
//
//  Created by Ani's Mac on 24.12.23.
//

import SwiftUI
import EffectsLibrary

struct OptionalTaskView: View {
    
    // MARK: - Properties
    @State private var isAnimating = false
    
    let gradientColors = [Color.pink, Color.blue]
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            SnowView()
            FireworksView()
            
            VStack(spacing: 20) {
                Text("Happy Christmas\nTBC IT Academy")
                    .foregroundStyle(LinearGradient(colors: gradientColors, startPoint: .leading, endPoint: .trailing))
                    .hueRotation(.degrees(isAnimating ? 320 : 0))
                    .scaleEffect(isAnimating ? 2 : 1)
                    .animation(Animation
                        .interpolatingSpring(duration: 1.0)
                        .repeatForever(autoreverses: true),
                               value: isAnimating)
                
                SwiftUIXmasTree2()
            }
        }
        .onAppear() {
            withAnimation {
                self.isAnimating = true
            }
        }
    }
}

#Preview {
    OptionalTaskView()
}


