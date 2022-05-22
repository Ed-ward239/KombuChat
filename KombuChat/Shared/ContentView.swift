//
//  ContentView.swift
//  Shared
//
//  Created by Edward Lee on 18/3/22.
//


import SwiftUI
import FirebaseCore
import Firebase
import SceneKit

//fixing preview crash
class firebaseManager: NSObject{
    let auth: Auth
    
    static let shared = firebaseManager() //singleton object
    
    override init() {
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        
        super.init()
    }
}
struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State var userIsLoggedIn = true
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        ZStack{
            
            if userIsLoggedIn{
                Login()
                VStack {
                    VStack {
                        TitleRow()
                        
                        ScrollViewReader { proxy in
                            ScrollView {
                                ForEach(messagesManager.messages, id: \.id) { message in
                                    MessageBubble(message: message)
                                }
                            }
                            .padding(.top, 10)
                            .background(.white)
                            .cornerRadius(30, corners: [.topLeft, .topRight]) // Custom cornerRadius modifier added in Extensions file
                            .onChange(of: messagesManager.lastMessageId) { id in
                                // When the lastMessageId changes, scroll to the bottom of the conversation
                                withAnimation {
                                    proxy.scrollTo(id, anchor: .bottom)
                                }
                            }
                        }
                    }
                    .background(Color("Purple"))
                    
                    MessageField()
                        .environmentObject(messagesManager)
                }
            } else {
                SignUp()
            }
        
            HStack{
                Text(userIsLoggedIn ? "New Member?" : "Already a memeber?")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            Button(action: {
                userIsLoggedIn.toggle()
            } ,label: {
                Text(userIsLoggedIn ? "Sign Up" : "Log In")
                    
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            })
            }
            .offset(y: 300)
            .padding(.top)
            .offset(y: 50)
        }
        .ignoresSafeArea()
        
    }
}
/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
