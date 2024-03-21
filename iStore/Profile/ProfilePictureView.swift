//
//  ProfilePictureView.swift
//  iStore
//
//  Created by Mohamed Sayed on 19.03.24.
//

import SwiftUI

struct ProfilePictureView: View {
    private let image: URL
    
    init(image: URL) {
        self.image = image
    }
    
    var body: some View {
        HStack() {
            Spacer()
            
            AsyncImage(url: image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .shadow(color: .black, radius: 10)
            } placeholder: {
                ProgressView()
            }
            .padding()
            
            Spacer()
        }
    }
}
