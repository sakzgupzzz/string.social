import SwiftUI

struct SocietyMessagesPage: View {
    @State private var society: [Society] = [
        Society(name: "AOM", isJoined: false, profilePicture: "Avengers"),
        Society(name: "JLM", isJoined: true, profilePicture: "JLM")
    ]
    @State private var selectedSociety: Society?
    
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
                HStack {
                    Text("Society Messages")
                        .bold()
                        .font(.title)
                }
                ForEach(society) { society in
                    Button(action: {
                        self.selectedSociety = society
                    }) {
                        SocietyDirectMessageRow(contact: society)
                    }
                }
                Spacer()
            }
            .padding()
            .sheet(item: $selectedSociety) { society in
                IndividualSocietyMessagesPage(society: society)
            }
        }
    }
}

struct IndividualSocietyMessagesPage: View {
    let society: Society
    @State private var newMessage = ""
    @State private var messages: [(String, Bool)] = [
        ("Hey, how are you?", false),
        ("I'm good, thanks! How about you?", false),
        ("I'm great, thanks for asking!", false)
    ]
    
    var body: some View {
        VStack {
            Text("Messages with \(society.name)")
                .font(.title)
                .padding()
            
            List(messages.indices, id: \.self) { index in
                let message = messages[index]
                SocietyMessageView(text: message.0, isSentByMe: message.1)
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

struct SocietyDirectMessageRow: View {
    var contact: Society
    
    var body: some View {
        HStack {
            if let profilePicture = contact.profilePicture {
                Image(profilePicture)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
            }
            
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

struct SocietyMessageView: View {
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



struct SocietyMessagesPage_Previews: PreviewProvider {
    static var previews: some View {
        SocietyMessagesPage()
    }
}
