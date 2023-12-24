//
//  MainTaskView.swift
//  Animations
//
//  Created by Ani's Mac on 24.12.23.
//

import SwiftUI

struct MainTaskView: View {
    
    // MARK: - Properties
    @State private var isAnimating = false
    @State private var currentColor = Color.blue
    
    private let colors: [Color] = [.blue, .brown, .red, .red, .brown, .blue]
    
    // MARK: - Body
    var body: some View {
        Text("TBC IT Academy")
            .font(.system(size: 20, weight: .medium))
            .foregroundColor(currentColor)
            .scaleEffect(isAnimating ? 1.5 : 1)
            .offset(y: isAnimating ? -60 : 0)
            .animation(Animation
                .easeInOut(duration: 1.8)
                .repeatForever(autoreverses: true),
                       value: isAnimating)
        
            .onAppear() {
                withAnimation {
                    self.isAnimating = true
                }
                startColorCycle()
            }
    }
    
    // MARK: - Methods
    private func startColorCycle() {
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { timer in
            withAnimation {
                self.currentColor = colors[index]
            }
            
            index = (index + 1) % colors.count
            
            if !isAnimating {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    MainTaskView()
}
