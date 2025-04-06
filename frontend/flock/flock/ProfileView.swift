//
//  ProfileView.swift
//  flock
//
//  Created by Maxine Paredes on 2025-04-05.
//

import SwiftUI

// Activity Model for storing the activity log data
struct Activity: Identifiable {
    var id = UUID()
    var title: String
    var date: String
    var description: String
}

struct ProfileView: View {
    // Example activity log data
    let activities = [
        Activity(title: "Snowboarding", date: "April 4, 2025", description: "Hitting the slopes with friends in Whistler Blackcomb!"),
        Activity(title: "Camping", date: "April 1, 2025", description: "A weekend camping trip in Garibaldi Provincial Park."),
        Activity(title: "Bouldering", date: "March 28, 2025", description: "A fun bouldering session at Hive North Vancouver with Maxine."),
        Activity(title: "Hiking", date: "March 15, 2025", description: "A scenic hike up Grouse Mountain with friends."),
        Activity(title: "Hiking", date: "March 15, 2025", description: "A scenic hike up Grouse Mountain with friends.")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    ZStack(alignment: .bottomLeading) {
                        // Banner image
                        Image("bannerImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                            .ignoresSafeArea(edges: .top)
                        
                        // Profile image overlapping the banner
                        Image("profileImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 4)
                            )
                            .shadow(radius: 5)
                            .offset(x: 20, y: 50)
                    }
                    .frame(height: 250)
                    .padding(.bottom, 50)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        // Profile Name and Bio
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
                        
                        // Followers, Following, Communities info
                        HStack(spacing: 40) {
                            VStack(spacing: 2) {
                                Text("15")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Followers")
                                    .font(.system(size: 15))
                                    .fontWeight(.light)
                            }

                            VStack(spacing: 2) {
                                Text("13")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Following")
                                    .font(.system(size: 15))
                                    .fontWeight(.light)
                            }

                            VStack(spacing: 2) {
                                Text("4")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Communities")
                                    .font(.system(size: 15))
                                    .fontWeight(.light)
                            }
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, 22)
                    
                    // Activity Log Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Activity Log")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.top)
                        Divider()
                        
                        
                        // Loop through each activity
                        ForEach(activities) { activity in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(activity.title)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.purple)
                                
                                Text(activity.date)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Text(activity.description)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .lineLimit(3) // Limit description to 3 lines for compactness
                            }
                            .padding(.bottom, 10)
                            Divider()
                        }
                    }
                    .padding(.horizontal, 22)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
