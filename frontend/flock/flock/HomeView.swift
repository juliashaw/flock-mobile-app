//
//  HomeView.swift
//  flock
//
//  Created by Claire Nguyen on 2025-04-05.
//

import SwiftUI

struct HomeView: View {
    
    @State var adventureText = ""
    @State var idkwhatthisis = ""
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom){
                Image("mountainImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay(Color.black.opacity(0.5))
                
                VStack{
                    Spacer()
                    Text("What adventures are you looking for today?")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .padding(.vertical, 20)
                    
                    TextField("Snowboarding...", text: $adventureText)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .foregroundColor(.black)
                                    .frame(width: 350)
                                    .padding(.vertical, 10)
                    
                    TextField("With other...", text: $idkwhatthisis)
                                    .padding()
                                    .padding(.vertical, 20)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .foregroundColor(.black)
                                    .frame(width: 350)
                                    .padding(.vertical, 10)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Button(action: {
                    }) {
                        Text("Go exploring!")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200)
                            .background(.purple)
                            .cornerRadius(30)
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        HStack {
                            Spacer()
                            
                            NavigationLink(destination: HomeView()) {
                                Image(systemName: "house")
                            }
                            .foregroundColor(.black)

                            Spacer()
                            
                            NavigationLink(destination: SearchView()) {
                                Image(systemName: "magnifyingglass")
                            }
                            .foregroundColor(.black)

                            Spacer()
                            
                            NavigationLink(destination: ProfileView()) {
                                Image(systemName: "person")
                            }
                            .foregroundColor(.black)

                            Spacer()
                        }
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    }
                    .ignoresSafeArea(edges: .bottom)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
