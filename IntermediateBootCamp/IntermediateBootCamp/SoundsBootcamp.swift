//
//  SoundsBootcamp.swift
//  IntermediateBootCamp
//
//  Created by Spencer Hurd on 2/15/22.
//

import SwiftUI
import AVKit

class SoundManager {
    
    // Singleton = a single instance of the object
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(
            forResource: sound.rawValue,
            withExtension: ".mp3")
        else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
        
    }
}

struct SoundsBootcamp: View {
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Play sound 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
