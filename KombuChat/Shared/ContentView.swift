//
//  ContentView.swift
//  Shared
//
//  Created by Edward Lee on 18/3/21.
//

import SwiftUI
import Firebase
import SceneKit



struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State var userIsLoggedIn = true
   
    var body: some View {
        ZStack{
            
            //ffs edward stop cluttering the main place, keep here simple
            if userIsLoggedIn{
                Login()
                    .transition(.move(edge: .trailing))
            } else {
                SignUp()
                    .transition(.move(edge: .trailing))
            }
            //donny has to pick one init
        
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

//
//    func signUp(){
//    Auth.auth().createUser(withEmail: username, password: password) {
//            result, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            }
//        }
//    }
//
//    func singIn(){
//        Auth.auth().signIn(withEmail: username, password: password) {
//            result, error in
//            if error != nil{
//                print(error!.localizedDescription)
//            }
//        }
//    }
    
    
}

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
