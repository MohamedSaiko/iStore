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
                    .font(.system(size: 50))
                    .foregroundColor(.pink)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Your Location")
                        .font(.system(.subheadline, design: .rounded))
                        .opacity(0.5)
                    
                    Text("obour block 12")
                        .font(.system(.headline, design: .rounded))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
        }
        .tint(.black)
    }
}
