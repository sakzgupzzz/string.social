//
//  PrimaryContactsButton.swift
//  string.social
//
//  Created by Saksham Gupta on 4/4/24.
//
import SwiftUI

struct PrimaryContactsButton: View {
    let action: () -> Void
    let messageColors: [Color] = [.red, .green, .blue]

    
    var body: some View {
        Button(action:action){
            ZStack {
                ForEach(0..<messageColors.count, id: \.self) { index in
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(messageColors[index])
                        .offset(y: CGFloat(index - 1) * 5)
                }
                .padding()
            }
        }
    }
}





