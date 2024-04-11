//
//  AddSocietyPage.swift
//  string.social
//
//  Created by Saksham Gupta on 4/11/24.
//

import Foundation
import SwiftUI

struct AddSocietyPage: View {

    
    @State private var society: [Society] = [
        Society(name:"JLM", isJoined: true, profilePicture: "JLM"),
        Society(name:"AOM", isJoined: false, profilePicture: "Avengers")
    ]
    
    var body: some View{
        VStack(alignment: .leading, spacing: 20) {
            HStack(){
                Text("Browse Public Societies")
                    .font(.headline)
                Spacer()
                Text("Join")
            }.padding()
            ForEach(0..<society.count, id: \.self) { index in
                SocietyRow(society: $society[index])
            }
            Spacer()
        }
        .padding()
    }
}

struct SocietyRow: View {
    @Binding var society: Society
    
    var body: some View {
        HStack {
            if let profilePicture = society.profilePicture {
                Image(profilePicture)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                    .shadow(radius: 5)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
            }
            
            Text(society.name)
                .font(.headline)
                .foregroundColor(.black)
            
            Spacer()
            
            Toggle("", isOn: $society.isJoined)
                .labelsHidden()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

