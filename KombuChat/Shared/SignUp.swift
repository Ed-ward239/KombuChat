//
//  Login.swift
//  kombuchat
//
//  Created by Devin Lin on 4/30/22.
//

import SwiftUI
import Firebase

struct SignUp: View {
    @State private var email = ""
    @State private var password = ""
    @State var userIsLoggedIn = true
    var body: some View {
        
        //  i like the color, we can still change it if you want to
            ZStack{
                Color.gray
                
                
                
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 1000)
                    .rotationEffect(.degrees(180))
                    .offset(y: -10)
                
                VStack(spacing: 20){
                    Text("KombuChat")
                        
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .offset(x: 0, y: -159)
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .offset(x: -105, y: -50)
                    
                 
                    TextField("Choose a Email", text: $email) //use $ for wrapping the string
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty){
                            Text("Choose a Email")
                        .foregroundColor(.white)
                        .bold()
                }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                SecureField("Create a Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty){
                        Text("Create a Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding(.top,20)
           
           
               
                    
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                    
                    Button{
                        handleAction()
                    }label: {
                      Text("Create Account")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.indigo], startPoint: .top, endPoint: .bottomTrailing)))
                            .foregroundColor(.white)
                            .padding(20)
                    }
                  
                    .offset(y: 10)
                    .padding(.top)
                    .offset(y: 50)
                    
                    // create user .unfinished
                   
                  
            }
                
                .frame(width: 350)
                
                
               
            }
            .ignoresSafeArea()
        
        }
    //calls this private function to create the user
    private func handleAction  (){
        createNewAccount()
    }
    func createNewAccount(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, err in
            if let err = err {
                print("Failed to create user:", err)
                return
            }
            print("Successfully created user: \(result?.user.uid ?? "")")
        }
    }
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
