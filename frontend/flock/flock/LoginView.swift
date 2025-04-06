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
        ZStack {
            VStack(spacing: 20) {
                Spacer().frame(height: 100)
                
                Text("FLOCK")
                    .font(.system(size: 50, weight: .bold))

                Spacer().frame(height: 40)

                SignInWithAppleButton(
                    onRequest: { _ in },
                    onCompletion: { _ in }
                )
                .frame(width: 150, height: 30)
                .cornerRadius(15)

                Spacer().frame(height: 40)

                Text("Or login with email:")
                    .foregroundColor(.white)

                TextField("email", text: $username)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 30)
                    .overlay(
                        Rectangle()
                            .frame(width: 300, height: 1)
                            .foregroundColor(.white),
                        alignment: .bottom
                    )

                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 30)
                    .overlay(
                        Rectangle()
                            .frame(width: 300, height: 1)
                            .foregroundColor(.white),
                        alignment: .bottom
                    )

                Button(action: {}) {
                    Text("Sign in")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color.purple)
                        .cornerRadius(30)
                }

                Spacer().frame(height: 40)

                Text("Don't have an account?")
                Button("Sign up") {}
            }
            .padding(.bottom, 40)
            .frame(maxWidth: .infinity, maxHeight: .infinity) //  This ensures full screen
        }
        .background(
            Image("flockImage")
                .resizable()
                .scaledToFill()
                .offset(x: 120)
                .ignoresSafeArea()
                .overlay(Color.gray.opacity(0.3))
        )
    }
}

#Preview {
    LoginView()
}
