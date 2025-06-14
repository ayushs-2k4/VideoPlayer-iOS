//
//  PlayerView.swift
//  VideoPlayerPractice
//
//  Created by magicpin on 14/6/25.
//

import SwiftUI

struct PlayerView: View {
    init(streams: [VideoStream], selectedStreamIndex: Int) {
        self.allStreams = streams
        self.selectedStream = streams[selectedStreamIndex]
    }

    @State private var controller = PlayerController()
    @State private var selectedStream: VideoStream {
        didSet {
            controller.initPlayer(playerItem: selectedStream)
        }
    }

    let allStreams: [VideoStream]
    var filteredStreams: [VideoStream] {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmed.isEmpty {
            return allStreams
        }

        let lowercasedSearch = trimmed.lowercased()

        var results: Set<VideoStream> = []

        // 1. Add all "IN" country streams if the search is "india"
        if lowercasedSearch == "india" {
            results.formUnion(allStreams.filter { $0.artist.lowercased() == "in" })
        }

        // 2. Add other matches (title or artist)
        results.formUnion(allStreams.filter {
            $0.title.localizedCaseInsensitiveContains(trimmed) ||
            $0.artist.localizedCaseInsensitiveContains(trimmed)
        })

        return Array(results).sorted { $0.title < $1.title }
    }

    var groupedStreams: [String: [VideoStream]] {
        Dictionary(grouping: filteredStreams) { stream in
            stream.artist.isEmpty ? "Unknown" : stream.artist
        }
    }

    @State private var expandedCountries: [String: Bool] = [:]
    var expandedBindings: [String: Binding<Bool>] {
        Dictionary(uniqueKeysWithValues: groupedStreams.map { group in
            let country = group.key
            let binding = Binding<Bool>(
                get: { expandedCountries[country, default: true] },
                set: { expandedCountries[country] = $0 }
            )
            return (country, binding)
        })
    }

    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                VideoPlayerView(controller: controller)
                    .frame(height: 250)
                    .cornerRadius(12)

                List {
                    ForEach(groupedStreams.sorted(by: { $0.key < $1.key }), id: \.key) { group in
                        let country = group.key
                        let streams = group.value

                        let isExpandedBinding = Binding<Bool>(
                            get: { expandedCountries[country] ?? true }, // default to expanded
                            set: { newValue in
                                expandedCountries[country] = newValue
                            }
                        )

                        Section(country, isExpanded: isExpandedBinding) {
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
                    }
                }

                VStack {
                    Toggle("Linear Playback", isOn: $controller.doesRequireLinearPlayback)
                }
                .padding()

                Spacer()
            }
        }
        .searchable(text: $searchText)
        .onAppear {
            controller.initPlayer(playerItem: self.selectedStream)
        }
    }
}

#Preview {
    PlayerView(streams: getStreams(), selectedStreamIndex: 0)
}
