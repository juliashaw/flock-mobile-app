//
//  GroupsView.swift
//  flock
//
//  Created by Claire Nguyen on 2025-04-05.
//

//
//  GroupsView.swift
//  flock
//
//  Created by Maxine Paredes on 2025-04-05.
//

import SwiftUI

struct Group: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    var location: String
}


struct SearchResultsView: View {
    var groups: [Group]
    
    var body: some View {
        VStack{
            
            Spacer().frame(height: 10)
            Text("Search Results")
                .fontWeight(.bold)
                .font(.system(size: 20))
                .font(.headline)
                .foregroundColor(.purple)
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(groups) { group in
                        GroupRow(group: group)
                        Divider()
                    }
                }
            }
        }
    }
}

struct GroupRow: View {
    var group: Group

    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            HStack {
                Image(group.imageName)  // Displaying an image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())  // Makes the image circular
                
                VStack(alignment: .leading) {
                    Text(group.name)
                        .font(.headline)
                    Text("Location: \(group.location)")
                        .font(.footnote)
                    .foregroundColor(.purple)
                    Text(group.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
}
            }
        }
        .padding()
    }
}

// Example preview
struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
    SearchResultsView(groups: [
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
              location: "Richmond, BC")
    ])
    }
}
