//
//  AVPlayer+Ding.swift
//  ScrumDinger2
//
//  Created by Thierno Diallo on 9/21/24.
//

import Foundation

import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
