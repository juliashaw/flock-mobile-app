//
//  LoginView.swift
//  flock
//
//  Created by Claire Nguyen on 2025-04-05.
//

import SwiftUI
import AuthenticationServices


struct LoginView: View {
    
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height:100)
            
            Text("FLOCK")
                .font(.system(size:50, weight: .bold))
            Spacer()
                .frame(height: 90)
            
            SignInWithAppleButton(
                onRequest: { request in
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
                },
                onCompletion: { result in
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
                }
            )
            
            .frame(width: 150, height: 30)
            .cornerRadius(15)
            Spacer()
                .frame(height: 40)
            
            
                .frame(height: 80)
            Text("Or login with email:")
            Spacer()
                .frame(height:20)
            
            TextField("email", text: $username)
                .padding()
                .padding(.horizontal, 30)
                .overlay(
                    Rectangle()
                        .frame(height:1)
                        .foregroundColor(.gray)
                        .padding()
                        .padding(.horizontal, 30),
                    alignment: .bottom
                    )
            
            SecureField("Password", text: $password)
                .padding()
                .padding(.horizontal, 30)
                .overlay(
                    Rectangle()
                        .frame(height:1)
                        .foregroundColor(.gray)
                        .padding()
                        .padding(.horizontal, 30),
                    alignment: .bottom
                    )
            
            Button(action: {
            }) {
                Text("Sign in")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.purple)
                    .cornerRadius(30)
            }
            .padding(.horizontal, 90)
            
            Spacer()
                .frame(height: 100)
            
            Text("Don't have an account?")
            
            Button("Sign up") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
           
            
        }
    }
}

#Preview {
    LoginView()
}
