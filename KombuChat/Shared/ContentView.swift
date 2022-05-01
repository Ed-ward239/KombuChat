//
//  ContentView.swift
//  Shared
//
//  Created by Edward Lee on 18/3/22.
//

import SwiftUI
import Firebase



struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
    var body: some View {
        if userIsLoggedIn {
            ListView()
        }else{
            content
        }
    }
    
    var content: some View {
        ZStack{
            Color.gray
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 600)
                .rotationEffect(.degrees(140))
                .offset(y: -40)
            
            VStack(spacing: 20){
                Text("KombuChat")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: 0, y: -100)
                
                TextField("Username", text: $username)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: username.isEmpty){
                        Text("Username")
                    .foregroundColor(.white)
                    .bold()
            }
            
            Rectangle()
                .frame(width: 350, height: 1)
                .foregroundColor(.white)
            SecureField("Password", text: $password)
                .foregroundColor(.white)
                .textFieldStyle(.plain)
                .placeholder(when: password.isEmpty){
                    Text("Password")
                        .foregroundColor(.white)
                        .bold()
                }
            Rectangle()
                .frame(width: 350, height: 1)
                .foregroundColor(.white)
                
                Button{
                    // Sign in
                }label: {
                  Text("Sign in")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.linearGradient(colors: [.indigo], startPoint: .top, endPoint: .bottomTrailing)))
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 10)
                
                Button{
                    // Sing up
                } label: {
                    Text("Don't have an account? Sign up.")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y: 50)
        }
            .frame(width: 350)
            .onAppear{
                Auth.auth().addStateDidChangeListener{ auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func signUp(){
        Auth.auth().createUser(withUsername: username, password: password)
        {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func singIn(){
        Auth.auth().signIn(withUsername: username, password: password)
        { result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    
    
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
