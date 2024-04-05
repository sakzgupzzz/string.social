//
//  AddNewContactPage.swift
//  string.social
//
//  Created by Saksham Gupta on 4/5/24.
//

import Foundation
import SwiftUI

struct AddNewContactPage: View {
    @Binding var contacts: [ContactsPage.Contact]
    @Environment(\.presentationMode) var presentationMode
    
    @State private var newContactName: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter contact name", text: $newContactName)
                .padding()
            
            Button(action: {
                // Add new contact
                if !newContactName.isEmpty {
                    contacts.append(ContactsPage.Contact(name: newContactName, isToggleOn: false))
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Add Contact")
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .navigationBarTitle("Add New Contact", displayMode: .inline)
    }
}
