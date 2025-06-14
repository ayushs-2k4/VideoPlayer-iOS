//
//  AppDelegate.swift
//  VideoPlayerPractice
//
//  Created by magicpin on 14/6/25.
//

import AVFAudio
import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback)
            try audioSession.setActive(true)
        } catch {
            print("Failed to set up AVAudioSession:", error)
        }
        return true
    }
}
