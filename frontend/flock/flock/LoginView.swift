//
//  LoginView.swift
//  flock
//
//  Created by Claire Nguyen on 2025-04-05.
//

import SwiftUI

struct LoginView: View {
    
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            Text("FLOCK")
                .font(.system(size:50, weight: .bold))
            Spacer()
                .frame(height: 90)
            Text("Login with")
            Spacer()
                .frame(height: 80)
            Text("Or login with email:")
            Spacer()
                .frame(height:50)
            
            TextField("email", text: $username)
                .padding()
                .overlay(
                    Rectangle()
                        .frame(height:1)
                        .foregroundColor(.gray)
                        .padding(),
                    alignment: .bottom
                    )
            SecureField("Password", text: $password)
                .padding()
                .overlay(
                    Rectangle()
                        .frame(height:1)
                        .foregroundColor(.gray)
                        .padding(),
                    alignment: .bottom
                    )
            
            
            
        }
    }
}

#Preview {
    LoginView()
}
