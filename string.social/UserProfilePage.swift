//
//  UserProfilePage.swift
//  string.social
//
//  Created by Saksham Gupta on 4/12/24.
//

import Foundation
import SwiftUI

struct UserProfilePage: View{
    var imageName: String
    
    var body: some View {
        // Customize your detailed profile view here
        Image(imageName)
            .resizable()
            .scaledToFit()
            .padding()
    }
}
