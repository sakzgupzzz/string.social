//
//  ContentView.swift
//  string.social
//
//  Created by Saksham Gupta on 4/2/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false

    var body: some View {
            NavigationView {
                if isLoggedIn {
                    HomePage(friendImageNames: ["Shivam"]) // Show HomePage if logged in
                } else {
                    VStack {
                        TextField("Username", text: $username)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button(action: {
                            // Perform login action here
                            // For simplicity, let's just print the username and password
                            print("Username: \(username), Password: \(password)")
                            
                            // Set isLoggedIn to true on successful login
                            isLoggedIn = true
                        }) {
                            Text("Login")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                    .navigationTitle("Login")
                }
            }
        }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
