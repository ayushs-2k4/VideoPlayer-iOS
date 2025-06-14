//
//  ContentView.swift
//  VideoPlayerPractice
//
//  Created by magicpin on 14/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlayerView(streams: getStreams(), selectedStreamIndex: 0)
    }
}

#Preview {
    ContentView()
}
