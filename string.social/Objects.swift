//
//  Objects.swift
//  string.social
//
//  Created by Saksham Gupta on 4/11/24.
//

import Foundation

struct Society: Identifiable {
    var id = UUID()
    var name: String
    var isJoined: Bool
    var profilePicture: String?
}
