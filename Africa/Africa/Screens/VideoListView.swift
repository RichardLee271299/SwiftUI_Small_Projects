//
//  VideoListView.swift
//  Africa
//
//  Created by Kirill Sytkov on 05.07.2022.
//

import SwiftUI

struct VideoListView: View {
   //MARK: - Properties
   @State var videos: [VideoModel] = Bundle.main.decode("videos.json")
   
   let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
   
   //MARK: - Body
    var body: some View {
       NavigationView {
          List {
             ForEach(videos) { item in
                NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                   VideoListItemView(video: item)
                      .padding(.vertical, 8)
                }
             } // LOOP
          } // LIST
          .listStyle(.insetGrouped)
          .navigationTitle("Videos")
          .navigationBarTitleDisplayMode(.inline)
          .toolbar {
             ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                   videos.shuffle()
                   hapticImpact.impactOccurred()
                } label: {
                   Image(systemName: "arrow.2.squarepath")
                }

             }
          }
       } //NAVIGATION
       
    }
}

//MARK: - Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
