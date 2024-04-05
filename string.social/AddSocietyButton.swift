//
//  AddSocietyButton.swift
//  string.social
//
//  Created by Saksham Gupta on 4/5/24.
//

import Foundation
import SwiftUI

struct AddSocietyButton: View {
    let messageColors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        ZStack {
            ForEach(0..<messageColors.count, id: \.self) { index in
                Image(systemName: "plus.circle")
                    .resizable()
                    .foregroundColor(messageColors[index])
                    .font(.title)
                    .frame(width: 30, height: 30)
                    .offset(y: CGFloat(index - 1) * 5)
            }
        }
    }
}
