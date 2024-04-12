//
//  Profiles.swift
//  string.social
//
//  Created by Saksham Gupta on 4/3/24.
//
import SwiftUI
import Foundation

struct RandomConcentricCirclesView: View {
    let circleCount: Int
    let minRadius: CGFloat
    let maxRadius: CGFloat
    let minOffset: CGFloat
    let maxOffset: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<circleCount, id: \.self) { _ in
                let radius = CGFloat.random(in: self.minRadius...(min(geometry.size.width, geometry.size.height) / 2))
                let offset = CGFloat.random(in: self.minOffset...self.maxOffset)
                let circleSize = radius + offset
                let xOffset = CGFloat.random(in: -5...10) // Adjust the x offset by -2 to 2 pixels
                let yOffset = CGFloat.random(in: -10...5) // Adjust the y offset by -2 to 2 pixels
                let randomColor = Color(red: Double.random(in: 0...1),
                                         green: Double.random(in: 0...1),
                                         blue: Double.random(in: 0...1))
                Circle()
                    .stroke(randomColor)
                    .frame(width: circleSize * 2, height: circleSize * 2)
                    .position(x: geometry.size.width / 2 + xOffset, y: geometry.size.height / 2 + yOffset)
            }
        }
        .padding(20)
        .drawingGroup()
    }
}

struct UserProfile: View {
    var imageName: String
    var position: CGPoint
    @State private var isProfilePagePresented = false

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: 150, height: 150)
            .overlay(RandomConcentricCirclesView(circleCount: 30, minRadius: 70, maxRadius: 70, minOffset: 1, maxOffset: 10).frame(width: 180, height: 180))
            .position(position)
            .onTapGesture {
                isProfilePagePresented = true
            }
            .sheet(isPresented: $isProfilePagePresented) {
                UserProfilePage(imageName: imageName)
        }
    }
}




struct SocietyMemberProfile: View {
    @State private var isProfilePagePresented = false
    var imageName: String
    var position: CGPoint
    var mutual: Bool
    
    init(imageName: String, position: CGPoint, mutual: Bool) {
        self.imageName = imageName
        self.position = position
        self.mutual = mutual
    }
    
    var body: some View {
        ZStack{
            if mutual {
                MutualConnectionLine(position: position)
            }
            Image(imageName)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 50, height: 50) // Adjust size as needed
                .overlay(RandomConcentricCirclesView(circleCount: 30, minRadius: 25, maxRadius: 25, minOffset: 1, maxOffset: 10).frame(width: 90, height: 90))
                .position(position)
                .onTapGesture {
                    isProfilePagePresented = true
                }
                .sheet(isPresented: $isProfilePagePresented) {
                    SocietyMemberProfilePage(imageName: imageName)
                }
        }
    }
}

func initialPosition(index: Int, total: Int, geometry: GeometryProxy) -> CGPoint {
    let midPoint = middlePoint(geometry: geometry)
    let angleStep = 360 / CGFloat(total)
    let angle = angleStep * CGFloat(index)
    let angleRadians = angle * .pi / 180
    
    // Calculate the distance from the midpoint for placing the points
    let distanceFromMidpoint: CGFloat = 150
    
    // Calculate the position of the point using trigonometry
    let x = midPoint.x + cos(angleRadians) * distanceFromMidpoint
    let y = midPoint.y + sin(angleRadians) * distanceFromMidpoint
    return CGPoint(x: x, y: y)
}

struct MutualConnectionLine: View {
    var position: CGPoint
    let lineCount = 20 // Number of line segments
    
    var body: some View {
        GeometryReader { geometry in
            let midPoint = middlePoint(geometry: geometry)
            
            if self.position.x == midPoint.x || self.position.y == midPoint.y {
                // Draw kinks in the line
                ForEach(0..<self.lineCount, id: \.self) { _ in
                    let controlPoint1 = CGPoint(x: midPoint.x + CGFloat.random(in: -50...50), y: midPoint.y + CGFloat.random(in: -50...50))
                    let controlPoint2 = CGPoint(x: midPoint.x + CGFloat.random(in: -50...50), y: midPoint.y + CGFloat.random(in: -50...50))
                    let color1 = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
                    let color2 = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
                    
                    Path { path in
                        path.move(to: midPoint)
                        path.addCurve(to: self.position, control1: controlPoint1, control2: controlPoint2)
                    }
                    .stroke(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                }
            } else {
                // Draw kinks in the line
                ForEach(0..<self.lineCount, id: \.self) { _ in
                    let controlPoint1 = CGPoint(x: midPoint.x + CGFloat.random(in: -50...50), y: midPoint.y + CGFloat.random(in: -50...50))
                    let controlPoint2 = CGPoint(x: midPoint.x + CGFloat.random(in: -50...50), y: midPoint.y + CGFloat.random(in: -50...50))
                    let color1 = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
                    let color2 = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
                    
                    Path { path in
                        path.move(to: midPoint)
                        path.addCurve(to: self.position, control1: controlPoint1, control2: controlPoint2)
                    }
                    .stroke(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                }
            }
        }
    }
}


