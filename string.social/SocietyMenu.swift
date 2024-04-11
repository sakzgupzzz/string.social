//
//  SocietyMenu.swift
//  string.social
//
//  Created by Saksham Gupta on 4/3/24.
//
import SwiftUI
import Foundation

struct MenuButton: View {
    @State private var selectedItem = 0
    var options: [String]
    
    var body: some View {

            
            Picker(selection: $selectedItem, label: Text("")) {
                ForEach(0..<options.count, id: \.self) { index in
                    Text(self.options[index]).tag(index)
                }
            }
    }
}


