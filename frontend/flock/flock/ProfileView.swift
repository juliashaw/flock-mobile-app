//
//  ProfileView.swift
//  flock
//
//  Created by Claire Nguyen on 2025-04-05.
//

import SwiftUI

//struct Profile: Identifiable {
//    var id = UUID()
//    var name: String
//    var biography: String
//    var imageName: String
//    var location: String
//}

struct ProfileView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Image("profileImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:100, height: 100)
                        .padding(.horizontal, 22)
                        .padding(.top, 50)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity,
                       alignment: .leading)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Claire Nguyen")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("hi everyone! \n it's so nice to meet you!")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                    
                    Text("Vancouver, BC")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                    
                    HStack(spacing: 40) {
                        VStack(spacing: 2) {
                            Text("15")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Followers")
                                .font(.system(size: 15))
                                .fontWeight(.light)
                        }
                        .frame(alignment: .center)

                        VStack(spacing: 2) {
                            Text("13")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Following")
                                .font(.system(size: 15))
                                .fontWeight(.light)
                        }
                        .frame(alignment: .center)
                        
                        VStack(spacing: 2) {
                            Text("4")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Communities")
                                .font(.system(size: 15))
                                .fontWeight(.light)
                        }
                        .frame(alignment: .center)
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)

                        
                }
                .padding(.horizontal, 22)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}



#Preview {
    ProfileView()
}

