//
//  Login.swift
//  kombuchat
//
//  Created by Devin Lin on 4/30/22.
//

import SwiftUI
import Firebase

struct Login: View {
    @State private var email = ""
    @State private var password = ""
   
    var body: some View {
      
            ZStack{
                Color.gray
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 1000)
                    .rotationEffect(.degrees(160))
                    .offset(y: -10)
                
                VStack(spacing: 20){
                    Text("KombuChat")
                        
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .offset(x: 0, y: -180)
                    Text("Log In")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .offset(x: -120, y: -60)
                 
                    TextField("Email", text: $email)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty){
                            Text("Email")
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
                    .padding(.top,20)
                    
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                    // forgot password like a dumbass
                    Button(action: {}, label: {
                            Text("Forgot Password?")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button{
                        handleAction()
                    }label: {
                      Text("Sign in")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.indigo], startPoint: .top, endPoint: .bottomTrailing)))
                            .foregroundColor(.white)
                            //.padding(20)
                    }
                    Text(self.loginMessage)
                    // succesful log in with show the User UID
                        .foregroundColor(.white)
//                    .offset(y: 10)
//                    .padding(.top)
//                    .offset(y: 50)
            }
                .frame(width: 350)
            }
            .ignoresSafeArea()
        }
    private func handleAction(){
        loginUser()
    }
    //in case it cannot create account
    @State var loginMessage = ""
    
    func loginUser(){
        firebaseManager.shared.auth.signIn(withEmail: email, password: password) {
            result, err in
            if let err = err {
                print("Failed to login user:", err)
                self.loginMessage = "Failed to login account \(err)"
                return
            }
            print("Successfully logged in user: \(result?.user.uid ?? "")")
            
            self.loginMessage = "Successfully logged in user: \(result?.user.uid ?? "")"
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
