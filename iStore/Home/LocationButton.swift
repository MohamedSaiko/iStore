//
//  LocationButton.swift
//  iStore
//
//  Created by Mohamed Sayed on 10.02.24.
//

import SwiftUI

struct LocationButton: View {
    var body: some View {
        NavigationLink {
            Text("hello")
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "map.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Your Location")
                        .font(.subheadline)
                    
                    Text("obour block 12")
                        .font(.headline)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
        }
        .tint(.black)
    }
}

struct LocationButton_Previews: PreviewProvider {
    static var previews: some View {
        LocationButton()
    }
}
