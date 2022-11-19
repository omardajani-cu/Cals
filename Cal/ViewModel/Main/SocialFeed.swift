//
//  SocialFeed.swift
//  Cal
//
//  Created by Omar Dajani on 11/18/22.
//

import SwiftUI

struct SocialFeed: View {
    @State private var path: [Text] = []
    let posts: [PostModel] = [StatusUpdate(id: 2, title: "Good day", postedBy: "Omar", body: "Cool status body")]
    
    var body: some View {
        NavigationStack {
            List(posts) { post in
                NavigationLink("test") {
                    PostDetailView(post: post)
                }
            }
            .navigationTitle("Products")
        }
    }
}

struct SocialFeed_Previews: PreviewProvider {
    static var previews: some View {
        SocialFeed()
    }
}

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        Text(product.str)
    }
}

struct Product: Identifiable {
    var str: String = "title"
    var id: String = "1"
}
