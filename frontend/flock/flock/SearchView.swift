//
//  SearchView.swift
//  flock
//
//  Created by Claire Nguyen on 2025-04-05.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Image("profile")
                        .resizable()
                        . aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
