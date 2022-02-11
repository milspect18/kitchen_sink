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
                        .foregroundColor(.purple.opacity(0.3))
                )
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
                        .foregroundColor(.purple.opacity(0.3))
                )
        }
    }
}

struct RecipeThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            List {
                ForEach(0..<3) { _ in
                    RecipeThumbnailView("".data(using: .ascii)!, diameter: 60)
                        .padding(.vertical)
                }
            }
            
            List {
                ForEach(0..<3) { _ in
                    RecipeThumbnailView("".data(using: .ascii)!, diameter: 60)
                        .padding(.vertical)
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}
