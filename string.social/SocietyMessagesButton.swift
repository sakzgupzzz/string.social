//
//  SocietyMessagesButton.swift
//  string.social
//
//  Created by Saksham Gupta on 4/4/24.
//
import SwiftUI
import Foundation

struct SocietyMessagesButton: View {
    
    let messageColors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        ZStack {
            ForEach(0..<messageColors.count, id: \.self) { index in
                Image(systemName: "message")
                    .resizable()
                    .foregroundColor(messageColors[index])
                    .frame(width: 30, height: 30)
                    .offset(y: CGFloat(index - 1) * 5) // Adjust offset based on index
                    .padding()
            }
        }
    }
}
