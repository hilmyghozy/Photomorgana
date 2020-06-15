//
//  SpeechService.swift
//  Photomorgana
//
//  Created by Nani Sukma Putri Pratama on 15/06/20.
//  Copyright © 2020 hilmy ghozy. All rights reserved.
//

import AVFoundation
import UIKit

class SpeechService{
    let speechSynthizer = AVSpeechSynthesizer()
    func say(_ phrase:String){
//                guard UIAccessibility.isVoiceOverRunning else {
//                    return
//                }
        let utterenece = AVSpeechUtterance(string: phrase)
//        let langCode = "en-EN".localized
//        utterenece.voice = AVSpeechSynthesisVoice(language: langCode)
        speechSynthizer.speak(utterenece)
    }
}
