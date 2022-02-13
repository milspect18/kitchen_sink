//
//  RecipeThumbnailView.swift
//  Kitchen Sink
//
//  Created by Kyle Price on 2/11/22.
//

import SwiftUI

struct RecipeThumbnailView: View {
    let image: UIImage?
    let diameter: CGFloat
    
    init(_ imgData: Data, diameter: CGFloat) {
        self.image = UIImage(data: imgData)
        self.diameter = diameter
    }
    
    var body: some View {
        if let img = image {
            Image(uiImage: img)
                .resizable()
                .scaledToFill()
                .frame(width: diameter, height: diameter, alignment: .center)
                .clipped()
                .mask(Circle())
                .padding(4)
                .background(
                    Circle()
                        .foregroundColor(Color(uiColor: UIColor.systemBackground))
                )
                .shadow(color: .primary.opacity(0.2), radius: 5)
        } else {
            Image(systemName: "photo")
                .frame(width: diameter, height: diameter, alignment: .center)
                .font(.system(size: diameter * 0.6))
                .foregroundColor(.secondary)
                .clipped()
                .mask(Circle())
                .padding(4)
                .background(
                    Circle()
                        .foregroundColor(Color(uiColor: UIColor.systemBackground))
                )
                .shadow(color: .primary.opacity(0.2), radius: 5)
        }
    }
}

struct RecipeThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            List {
                RecipeThumbnailView("".data(using: .ascii)!, diameter: 60)
                    .padding(.vertical)
                
                RecipeThumbnailView(Recipe.example.image!, diameter: 60)
                    .padding(.vertical)
                
                RecipeThumbnailView("".data(using: .ascii)!, diameter: 60)
                    .padding(.vertical)
            }
            
            List {
                RecipeThumbnailView("".data(using: .ascii)!, diameter: 60)
                    .padding(.vertical)
                
                RecipeThumbnailView(Recipe.example.image!, diameter: 60)
                    .padding(.vertical)
                
                RecipeThumbnailView("".data(using: .ascii)!, diameter: 60)
                    .padding(.vertical)
            }
            .preferredColorScheme(.dark)
        }
    }
}
