//
//  SearchView.swift
//  flock
//
//  Created by Claire Nguyen on 2025-04-05.
//

import SwiftUI

struct Friend: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var profilePicture: String
}

struct SearchView: View {
    
    @State var search = ""
    @State var selectedTab = "Friends"
    
    let suggestedFriends: [Friend] = [
        Friend(name: "Rahi Kumar", location: "Vancouver, BC", profilePicture: "rahi_profile"),
        Friend(name: "Lexi Dutnall", location: "Burnaby, BC", profilePicture: "lexi_profile"),
        Friend(name: "Anabell Chiu-Carag", location: "Richmond, BC", profilePicture: "annabell_profile"),
        Friend(name: "Will Wang", location: "Vancouver, BC", profilePicture: "will_profile"),
        Friend(name: "Abhishek Rungta", location: "Vancouver, BC", profilePicture: "abhishek_profile"),
        Friend(name: "Sannah Stainsby", location: "Vancouver, BC", profilePicture: "Sannah_profile"),
        Friend(name: "Joshua Pablo", location: "Richmond, BC", profilePicture: "joshua_profile"),
        Friend(name: "Shveta Sharma", location: "Vancouver, BC", profilePicture: "shveta_profile"),
        Friend(name: "Jennifer Wing", location: "Vancouver, BC", profilePicture: "Jennifer_profile"),
        Friend(name: "Sharen Dhami", location: "Vancouver, BC", profilePicture: "sharen_profile"),
    ]
    
    let suggestedGroups: [Group] = [
        Group(name: "Shred Sirens", description: "Empowering women of all backgrounds to shred boldly.", imageName: "shred_sirens_image",
              location: "Whistler, BC"),
        Group(name: "Slay & Spray", description: "An inclusive space where female riders slay trails together.", imageName: "slay_spray_image",
                  location: "North Vancouver, BC"),
        Group(name: "Gnarly Gals", description: "No gatekeeping here—just gnarly, supportive vibes!", imageName: "gnarly_gals_image",
              location: "Squamish, BC"),
        Group(name: "Chill Chix", description: "An inclusive space where queer riders slay trails together.", imageName: "chill_chix_image",
              location: "Vancouver, BC"),
        Group(name: "Powder Queens", description: "Celebrating powerful women who conquer the mountain with style.", imageName: "powder_queens_image",
              location: "Coquitlam, BC"),
        Group(name: "Board Belles", description: "Where southern charm meets snowboarding—supporting women riders everywhere.", imageName: "board_belles_image",
              location: "Burnaby, BC"),
        Group(name: "Snow Sisters", description: "A welcoming space for BIPOC women to bond over snowboarding and adventure.", imageName: "snow_sisters_image",
              location: "Port Moody, BC"),
        Group(name: "Snowstorm Queens", description: "Creating a fierce, welcoming community for all women to push their limits on snow.", imageName: "snowstorm_queens_image",
              location: "Surrey, BC"),
        Group(name: "Shred Hunnies", description: "A vibrant community where all women can shred without judgment.", imageName: "shred_hunnies_image",
              location: "Richmond, BC"),
        Group(name: "Shred Hunnies", description: "A vibrant community where all women can shred without judgment.", imageName: "shred_hunnies_image",
              location: "Richmond, BC"),
        Group(name: "Sendit Sisters", description: "A vibrant community where all women can shred without judgment.", imageName: "shred_hunnies_image",
              location: "Richmond, BC"),
    ]
    
    var body: some View {
        
        let placeholder = selectedTab == "Friends" ? "Search friends..." : "Search groups..."
        
        VStack {
            Text("Search")
                .font(.system(size: 25, weight: .bold))
                .frame(alignment: .topLeading)
                .padding(.top, 20)
                .foregroundColor(.purple)
            
            Spacer()
                .frame(height: 20)
            
            
            HStack {
                VStack {
                    Button("Friends") {
                        selectedTab = "Friends"
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 50)
                    .font(.system(size: 20))
                    
                    Rectangle()
                              .frame(height: 2)
                              .foregroundColor(selectedTab == "Friends" ? .purple : .clear)
                              .frame(maxWidth: .infinity)

                }
                
                VStack {
                    Button("Groups") {
                        selectedTab = "Groups"
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 50)
                    .font(.system(size: 20))
                    
                    Rectangle()
                              .frame(height: 2)
                              .foregroundColor(selectedTab == "Groups" ? .purple : .clear)
                              .frame(maxWidth: .infinity)
                    
                }

            }
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(height: 100)
                
                TextField(placeholder, text: $search)
                    .padding()
                    .background(
                        Color.white
                            .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                    )
                    .cornerRadius(20)
                    .foregroundColor(.black)
                    .frame(width: 350)
            }
            
            
            
            ScrollView {
                
                if selectedTab == "Friends" {
                    VStack(alignment: .leading){
                        HStack {
                            Text("Suggested Friends")
                                .font(.headline)
                                .padding(.top, 10)
                                .padding(.bottom, 15)
                                .padding(.horizontal, 20)
                            Spacer()
                        }
                        
                        ForEach(suggestedFriends) { friend in
                            HStack(spacing: 15) {
                                Image(friend.profilePicture)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())

                                VStack(alignment: .leading) {
                                    Text(friend.name)
                                        .font(.subheadline)
                                    Text(friend.location)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                
                if selectedTab == "Groups" {
                    VStack(alignment: .leading){
                        HStack {
                            Text("Suggested Groups")
                                .font(.headline)
                                .padding(.top, 10)
                                .padding(.bottom, 15)
                                .padding(.horizontal, 20)
                            Spacer()
                        }
                        
                        ForEach(suggestedGroups) { group in
                            HStack(spacing: 15) {
                                Image(group.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text(group.name)
                                        .font(.subheadline)
                                    Text(group.location)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    SearchView()
}
