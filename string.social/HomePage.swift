import SwiftUI

struct HomePage: View {
    @State private var centerPoint: CGPoint = .zero
    @State private var isMenuOpen = false
    @State private var SocietyMemberNames = [["Shivam", true], ["Pruthi", true], ["Avnish", false], ["Nikhil", true], ["Alex", true], ["Shridhik", false], ["Srinath", true], ]
    
    @State private var isContactsPagePresented = false
    @State private var isDirectMessagePagePresented = false
    @State private var isAddSocietyPagePresented = false
    @State private var isSocietyMessagesPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Button(action: {
                        self.isAddSocietyPagePresented = true
                    })
                    {
                        AddSocietyButton {
                            self.isAddSocietyPagePresented = true
                        }
                    }
                    
                    MenuButton(options:["JLM"])
                    Spacer()
                    Button(action:{
                        self.isSocietyMessagesPresented = true
                    })
                    {
                        SocietyMessagesButton{
                            self.isSocietyMessagesPresented = true
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 5)
                .sheet(isPresented:
                        $isAddSocietyPagePresented){
                    AddSocietyPage()
                }
                        .sheet(isPresented:$isSocietyMessagesPresented){
                            SocietyMessagesPage()
                        }
                
                    
                HStack {
                    
                    GeometryReader { geometry in
                        ZStack{
                            let middle = middlePoint(geometry: geometry)
                            

                                ForEach(0..<SocietyMemberNames.count, id: \.self) { index in
                                    SocietyMemberProfile(imageName: SocietyMemberNames[index][0] as! String, position: initialPosition(index: index, total: SocietyMemberNames.count, geometry: geometry), mutual:SocietyMemberNames[index][1] as! Bool)
                                }
                                
                                UserProfile(imageName: "Ayush", position: CGPoint(x: middle.x, y: middle.y))
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
                    
                    Button(action:{
                        self.isDirectMessagePagePresented = true // Present DM page
                    })
                    {
                        DirectMessageButton{
                            self.isDirectMessagePagePresented = true
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 5)
                .sheet(isPresented:
                    $isDirectMessagePagePresented){
                    DirectMessagePage()
                }
                .sheet(isPresented: $isContactsPagePresented) {
                    ContactsPage()
                }

            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
