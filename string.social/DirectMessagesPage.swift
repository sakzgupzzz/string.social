//
//  DirectMessagesPage.swift
//  string.social
//
//  Created by Saksham Gupta on 4/5/24.
//
import SwiftUI

struct DirectMessagePage: View {
    struct Contact: Identifiable {
        var id = UUID()
        var name: String
    }
    @State private var contacts: [Contact] = [
        Contact(name: "Shivam")
    ]
    @State private var selectedContact: Contact?
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .center) {
                    Spacer()
                    Rectangle()
                        .frame(width: 40, height: 4)
                        .foregroundColor(Color.gray.opacity(0.5))
                        .cornerRadius(2)
                    Spacer()
                }
                HStack{
                    Text("Direct Messages")
                        .bold()
                        .font(.title)
                }
                ForEach(contacts) { contact in
                    Button(action: {
                        self.selectedContact = contact
                    }) {
                        DirectMessageRow(contact: contact)
                    }
                }
                Spacer()
            }
            .padding()

            .sheet(item: $selectedContact) { contact in
                MessagesPage(contact: contact)
            }
        }
    }
}
struct MessagesPage: View {
    let contact: DirectMessagePage.Contact
    @State private var newMessage = ""
    @State private var messages: [(String, Bool)] = [
        ("Hey, how are you?", false),
        ("I'm good, thanks! How about you?", false),
        ("I'm great, thanks for asking!", false)
    ]
    
    var body: some View {
        VStack {
            Text("Messages with \(contact.name)")
                .font(.title)
                .padding()
            
            List(messages.indices, id: \.self) { index in
                let message = messages[index]
                MessageView(text: message.0, isSentByMe: message.1)
                    .padding(.trailing, message.1 ? 20 : 8)
                    .padding(.leading, message.1 ? 8 : 20)
            }
            
            HStack {
                TextField("Type a message", text: $newMessage)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: sendMessage) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.trailing)
            }
            .padding()
        }
    }
    
    private func sendMessage() {
        guard !newMessage.isEmpty else { return }
        messages.append((newMessage, true)) // Message sent by me
        newMessage = ""
    }
}

struct DirectMessageRow: View {
    var contact: DirectMessagePage.Contact
    
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
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct MessageView: View {
    let text: String
    let isSentByMe: Bool
    
    var body: some View {
        HStack {
            if isSentByMe {
                Spacer()
            }
            Text(text)
                .padding()
                .foregroundColor(.white)
                .background(isSentByMe ? Color.blue : Color.gray)
                .cornerRadius(8)
            if !isSentByMe {
                Spacer()
            }
        }
    }
}

