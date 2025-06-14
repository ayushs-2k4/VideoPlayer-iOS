//
//  VideoPlayerView.swift
//  VideoPlayerPractice
//
//  Created by magicpin on 14/6/25.
//

import AVKit
import SwiftUI

struct VideoPlayerView: UIViewControllerRepresentable {
    var controller: PlayerController

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        controller.avPlayerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}
