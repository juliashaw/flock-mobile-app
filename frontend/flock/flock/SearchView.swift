//
//  SearchView.swift
//  flock
//
//  Created by Claire Nguyen on 2025-04-05.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        
        @State var search = ""
        
        VStack {
            Text("Search")
                .font(.system(size: 25, weight: .bold))
                .frame(alignment: .topLeading)
                .padding(.top, 20)
            
            Spacer()
            
            HStack {
                Button("Friends") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .foregroundColor(.black)
                .padding(.horizontal, 50)
                .font(.system(size: 20))

                
                Button("Groups") {
                    
                }
                .foregroundColor(.black)
                .padding(.horizontal, 50)
                .font(.system(size: 20))
            }
            
            TextField("Search...", text: $search)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .foregroundColor(.black)
                            .frame(width: 350)
                            .padding(.vertical, 10)
           
        }
        
    }
}

#Preview {
    SearchView()
}
