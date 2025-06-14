//
//  AdvancedVideoPlayer.swift
//  VideoPlayerPractice
//
//  Created by magicpin on 14/6/25.
//

import SwiftUI
import AVKit

struct AdvancedVideoPlayer: UIViewControllerRepresentable {
    let player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        
        controller.allowsPictureInPicturePlayback = true
        controller.canStartPictureInPictureAutomaticallyFromInline = true
        
        controller.updatesNowPlayingInfoCenter = true
        
//        controller.entersFullScreenWhenPlaybackBegins = true
//        controller.exitsFullScreenWhenPlaybackEnds = true
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = player
    }
}
