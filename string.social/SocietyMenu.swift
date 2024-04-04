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
            }/*.position(x:75, y:50)*/
    }
}

//struct RandomConcentricRectangles: View {
//    let rectangleCount: Int
//    let minCornerRadius: CGFloat
//    let maxCornerRadius: CGFloat
//    var body: some View{
//        GeometryReader { geometry in
//            ForEach(0..<rectangleCount) { _ in
//                let cornerRadius = CGFloat.random(in: self.minCornerRadius...(min(geometry.size.width, geometry.size.height) / 2))
//                let randomColor = Color(red: Double.random(in: 0...1),
//                                         green: Double.random(in: 0...1),
//                                         blue: Double.random(in: 0...1))
//                let yOffset = CGFloat.random(in: -10...5) // Adjust the y offset by -2 to 2 pixels
//                let xOffset = CGFloat.random(in: -5...10) // Adjust the x offset by -2 to 2 pixels
//                RoundedRectangle(cornerRadius: cornerRadius)
//                    .stroke(randomColor)
//                    .frame(width:100, height:50)
//                    .position(x:75+xOffset, y:50+yOffset)
//            }
//        }
//        .drawingGroup()
//    }
//}



