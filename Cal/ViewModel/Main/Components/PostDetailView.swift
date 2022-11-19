//
//  PostDetailView.swift
//  Cal
//
//  Created by Omar Dajani on 11/18/22.
//

import SwiftUI

struct PostDetailView: View {
    var post: PostModel
    var body: some View {
        VStack {
            Text(post.title)
                .font(.title)
            Text("Posted by \(post.postedBy)")
                .padding(.bottom, 50)
            Text(post.body)
        }
    }
}

//struct PostDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostDetailView()
//    }
//}
