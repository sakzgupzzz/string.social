//
//  DirectMessageButton.swift
//  string.social
//
//  Created by Saksham Gupta on 4/4/24.
//
import SwiftUI
import Foundation

struct DirectMessageButton: View {
    let action: () -> Void
    var body: some View {
        Button(action:action){
            
            ZStack {
                Image(systemName: "message")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange) // Adjust color as needed
                
            }
        }
    }
}
