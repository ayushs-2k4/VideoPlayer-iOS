//
//  PlayerController.swift
//  VideoPlayerPractice
//
//  Created by magicpin on 14/6/25.
//

import AVKit
import Foundation
import SwiftUI

@Observable
class PlayerController {
    var playbackURL: String = ""
    var player: AVPlayer?
    var avPlayerViewController = AVPlayerViewController()
    var doesRequireLinearPlayback: Bool = false {
        didSet {
            self.avPlayerViewController.requiresLinearPlayback = self.doesRequireLinearPlayback
        }
    }
    
    func initPlayer(playerItem: VideoStream) {
        self.initPlayer(
            url: playerItem.url,
            title: playerItem.title,
            artist: playerItem.artist,
            artworkURL: playerItem.artworkURL
        )
    }

    func initPlayer(
        url: String,
        title: String,
        artist: String,
        artworkURL: String
    ) {
        guard let imageURL = URL(string: artworkURL) else {
            print("Invalid artwork URL")
            self.initPlayer(url: url, title: title, artist: artist, artwork: nil)
            return
        }

        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            var image: UIImage?

            if let data = data {
                image = UIImage(data: data)
            } else {
                print("Failed to download artwork:", error ?? "Unknown error")
            }

            DispatchQueue.main.async {
                self.initPlayer(url: url, title: title, artist: artist, artwork: image)
            }
        }.resume()
    }

    func initPlayer(url: String, title: String, artist: String, artwork: UIImage?) {
        self.playbackURL = url
        let playerItem = AVPlayerItem(url: URL(string: url)!)

        if let artwork {
            let titleItem = AVMutableMetadataItem()
            titleItem.identifier = .commonIdentifierTitle
            titleItem.value = title as NSString
            titleItem.extendedLanguageTag = "und"

            let artistItem = AVMutableMetadataItem()
            artistItem.identifier = .commonIdentifierArtist
            artistItem.value = artist as NSString
            artistItem.extendedLanguageTag = "und"

            let artworkItem = AVMutableMetadataItem()
            artworkItem.identifier = .commonIdentifierArtwork
            artworkItem.value = artwork.jpegData(compressionQuality: 1.0)! as NSData
            artworkItem.dataType = kCMMetadataBaseDataType_JPEG as String
            artworkItem.extendedLanguageTag = "und"

            playerItem.externalMetadata = [titleItem, artistItem, artworkItem]
        }

        if self.player == nil {
            self.player = AVPlayer(playerItem: playerItem)
            
            self.player?.allowsExternalPlayback = true
            
            self.avPlayerViewController.player = self.player
            self.avPlayerViewController.allowsPictureInPicturePlayback = true
            self.avPlayerViewController.canStartPictureInPictureAutomaticallyFromInline = true
            //        self.avPlayerViewController.entersFullScreenWhenPlaybackBegins = true
            //        self.avPlayerViewController.exitsFullScreenWhenPlaybackEnds = true

            self.avPlayerViewController.updatesNowPlayingInfoCenter = true
        } else {
            self.player?.replaceCurrentItem(with: playerItem)
        }

        self.avPlayerViewController.requiresLinearPlayback = self.doesRequireLinearPlayback
        self.player?.play()
    }

    func play() {
        self.player?.play()
    }

    func pause() {
        self.player?.pause()
    }
}

