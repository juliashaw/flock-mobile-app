//
//  CommunityView.swift
//  flock
//
//  Created by Claire Nguyen on 2025-04-05.
//

import SwiftUI

struct Post: Identifiable {
    var id = UUID()
    var username: String
    var profilePicture: String
    var timeStamp: String
    var content: String
}

let demoPosts : [Post] = [
    Post(username: "Maxine Paredes", profilePicture:"maxine_picture", timeStamp: "April 6, 2025 at 8:57am", content: "Looking for a group of beginner gals to shred Whistler this weekend! Have 4 extra spots in my car, lemme know if you're interested! :)")
]



struct GroupView: View {
    
    @State var textPost = ""
    
    var body: some View {
        
        VStack {
            Image("snowboardGroupImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 600)
                .padding(.top, 20)
                .ignoresSafeArea()
            
            Text("Powder Puff Girls")
                .font(.system(size: 30, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            HStack {
                Image("snowboardIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text("Snowboarding")
                    .font(.system(size: 15))
                Spacer()
                    .frame(width:15)
                
                Image("membersIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text("289 Members")
                    .font(.system(size: 15))
                Spacer()
                    .frame(width:15)
                
                Image("publicIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .font(.system(size: 15))
                Text("Public")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
        }
        
        Spacer()
            .frame(height: 30)
        
       
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Text("Tags:")
            
            Text("All levels")
                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                .cornerRadius(10)
            
            Text("Women")
                .padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        
        Spacer()
            .frame(height:30)
        
        HStack  {
            TextField("Make a post...", text: $textPost)
            .padding()
            .frame(height:45)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
               )
            .padding(.leading, 15)
            
            Image("pictureIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 60)
                .padding(.trailing, 10)
            
        }
        
        Spacer()
            .frame(height: 30)
        
        Text("Browse Gear")
            .font(.system(size: 20, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                Image("gear1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                Image("gear3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                Image("gear2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                Image("gear5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                Image("gear4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
            }
        }
        
        
        Spacer()
            .frame(height: 30)
        
        Rectangle()
            .foregroundColor(Color.gray.opacity(0.2))
            .frame(height: 5)
            .padding(.bottom, 20)
        
        Text("Community Activity")
            .font(.system(size: 20, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
        
        Rectangle()
            .foregroundColor(Color.gray.opacity(0.2))
            .frame(height: 1)
            .padding(.bottom, 20)
            .padding([.leading, .trailing], 10)
        
        ForEach(demoPosts) { post in
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Image(post.profilePicture)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(post.username)
                            .font(.headline)
                        Text(post.timeStamp)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }

                Text(post.content)
                    .font(.body)
                    .padding(.top, 4)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            .padding(.horizontal, 20)
        }

        
    

            
        
        
        

    }
}

#Preview {
    GroupView()
}
