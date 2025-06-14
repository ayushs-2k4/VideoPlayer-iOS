//
//  PlayerView.swift
//  VideoPlayerPractice
//
//  Created by magicpin on 14/6/25.
//

import SwiftUI

struct PlayerView: View {
    init(streams: [VideoStream], selectedStreamIndex: Int) {
        self.streams = streams
        self.selectedStream = streams[selectedStreamIndex]
    }

    @State private var controller = PlayerController()
    @State private var selectedStream: VideoStream {
        didSet {
            controller.initPlayer(playerItem: selectedStream)
        }
    }

    let streams: [VideoStream]

    var body: some View {
        VStack {
            VideoPlayerView(controller: controller)
                .frame(height: 250)
                .cornerRadius(12)

            List {
                ForEach(streams) { stream in
                    Button(action: {
                        selectedStream = stream
                    }) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(stream.title)
                                    .font(.headline)
                                Text(stream.artist)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()

                            if stream == selectedStream {
                                Image(systemName: "speaker.wave.3")
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }

            VStack {
                Toggle("Linear Playback", isOn: $controller.doesRequireLinearPlayback)
            }
            .padding()

            Spacer()
        }
        .onAppear {
            controller.initPlayer(playerItem: self.selectedStream)
        }
    }
}

#Preview {
    PlayerView(streams: getStreams(), selectedStreamIndex: 0)
}
