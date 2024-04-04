import SwiftUI

struct HomePage: View {
    @State private var centerPoint: CGPoint = .zero
    @State private var isMenuOpen = false
    var friendImageNames: [String]
    
    var body: some View {
        

        VStack {
            HStack{
                //ZStack{
                MenuButton(options:["JLM"])
                Spacer()
//                    RandomConcentricRectangles(rectangleCount: 30, minCornerRadius:10, maxCornerRadius:10)
                    
                //}
            }
            .padding(.horizontal, 10)
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
        }
    }
}

    


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(friendImageNames: ["Shivam", "Avnish", "Pruthi", "Shridhik", "Nikhil", "Alex", "Srinath", "Ayush", "Avnish", "Shivam", "Nikhil", "Nikhil"])    }
}
    

