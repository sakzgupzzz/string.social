//
//  Tools.swift
//  string.social
//
//  Created by Saksham Gupta on 4/3/24.
//
import SwiftUI
import Foundation

func middlePoint(geometry: GeometryProxy) -> CGPoint {
    let screenWidthMid = geometry.size.width/2
    let screenHeightMid = geometry.size.height/2
    return CGPoint(x: screenWidthMid, y: screenHeightMid)
}
