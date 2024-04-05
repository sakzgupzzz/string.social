import SwiftUI

struct HomePage: View {
    @State private var centerPoint: CGPoint = .zero
    @State private var isMenuOpen = false
    var friendImageNames: [String]
    
    @State private var isContactsPagePresented = false // State to track whether contacts page is presented
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    AddSocietyButton()
                    MenuButton(options:["JLM"])
                    Spacer()
                    SocietyMessagesButton()
                }
                .padding(.horizontal, 20)
                .padding(.top, 5)
                    
                HStack {
                    
                    GeometryReader { geometry in
                        let middle = middlePoint(geometry: geometry)
                        
                        UserProfilePicture(imageName: "Ayush", position: CGPoint(x: middle.x, y: middle.y))
                        ForEach(0..<friendImageNames.count, id: \.self) { index in
                            FriendProfilePicture(imageName: friendImageNames[index], position: initialPosition(index: index, total: friendImageNames.count, geometry: geometry))
                        }
                    }
                }
                HStack {
                    Button(action: {
                        self.isContactsPagePresented = true // Present contacts page
                    }) 
                    {
                        PrimaryContactsButton {
                            self.isContactsPagePresented = true // Present contacts page
                        } // Button to open contacts page
                    }
                    Spacer()
                    
                    
                    DirectMessageButton()
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 5)
                .sheet(isPresented: $isContactsPagePresented) {
                    ContactsPage() // Present ContactsPage as a sheet
                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(friendImageNames: ["Shivam", "Avnish", "Pruthi", "Shridhik", "Nikhil", "Alex", "Srinath", "Ayush", "Avnish", "Shivam", "Nikhil", "Nikhil"])
    }
}
