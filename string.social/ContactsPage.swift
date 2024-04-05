//
//  ContactsPage.swift
//  string.social
//
//  Created by Saksham Gupta on 4/5/24.
//

import SwiftUI

struct ContactsPage: View {
    struct Contact {
        var name: String
        var isToggleOn: Bool
    }
    
    @State private var contacts: [Contact] = [
        Contact(name: "John Doe", isToggleOn: false),
        Contact(name: "Jane Smith", isToggleOn: false),
        Contact(name: "Michael Johnson", isToggleOn: false)
    ]
    @State private var isAddNewContactPagePresented = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .center) {
                Spacer()
                Rectangle()
                    .frame(width: 40, height: 4)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .cornerRadius(2)
                Spacer()
            }
            
            HStack {
                Spacer()
                Button(action: {
                    // Action to add new contact
                    isAddNewContactPagePresented = true
                }) {
                    Text("Create New Connection")
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $isAddNewContactPagePresented) {
                    AddNewContactPage(contacts: $contacts)
                }
                

                Spacer()
            }
            HStack{
                Text("Contacts")
                    .font(.title)
                    .bold()
                Spacer()
                Text("ADD SOCIETY NAME HERE")
            }
            ForEach(0..<contacts.count, id: \.self) { index in
                ContactRow(contact: $contacts[index])
            }
            Spacer()
        }
        .padding()
    }
}

struct ContactRow: View {
    @Binding var contact: ContactsPage.Contact
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
            
            Text(contact.name)
                .font(.headline)
                .foregroundColor(.black)
            
            Spacer()
            
            Toggle("", isOn: $contact.isToggleOn)
                .labelsHidden()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}



