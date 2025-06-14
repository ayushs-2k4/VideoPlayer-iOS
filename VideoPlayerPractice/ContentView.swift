//
//  ContentView.swift
//  VideoPlayerPractice
//
//  Created by magicpin on 14/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var streams: [VideoStream] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        Group {
            if isLoading {
                ProgressView("Loading streams...")
            } else if let errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                PlayerView(streams: streams, selectedStreamIndex: 0)
            }
        }
        .task {
            await loadStreams()
        }
    }

    private func loadStreams() async {
        do {
            let result = try await fetchIPTVStreams()
            streams = result
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
}

#Preview {
    ContentView()
}
