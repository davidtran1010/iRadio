//
//  PlayerService.swift
//  chiasenhac
//
//  Created by DavidTran on 3/8/18.
//  Copyright © 2018 DavidTran. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import MediaPlayer

extension CMTime {
    var isValid : Bool { return flags.contains(.valid) }
}

class AudioPlayer{
    static let shared = AudioPlayer()
    fileprivate var audioPlayer = AVPlayer()
   // fileprivate var url = ""
    //var songName = ""
    //var singer = ""
    var isTimeOut = false
    init() {

    }

    
    func setURL(urlString: String, completion:@escaping () -> Void){
        //self.url = urlString
        do {
            guard let url = URL.init(string: urlString) else {
                print("error url")
                return
            }
            audioPlayer = try AVPlayer(url: url)
            var audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                try audioSession.setActive(true)
                DispatchQueue.main.async {
                    UIApplication.shared.beginReceivingRemoteControlEvents()
                    
                }
                completion()
                
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
    func setupCommandCenter(channelName:String){
        let info = [MPMediaItemPropertyTitle:channelName] as [String : Any]
        MPNowPlayingInfoCenter.default().nowPlayingInfo = info
        
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.isEnabled = true
        commandCenter.pauseCommand.isEnabled = true
        //commandCenter.nextTrackCommand.isEnabled = true
        //commandCenter.previousTrackCommand.isEnabled = true
        //commandCenter.changePlaybackRateCommand.add
        
        
//        commandCenter.nextTrackCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
//            NotificationCenter.default.post(name: PLAY_NEXT_NOTIFICATION, object: nil)
//            return .success
//        }
//        commandCenter.previousTrackCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
//            NotificationCenter.default.post(name: PLAY_PRE_NOTIFICATION, object: nil)
//            return .success
//        }
        
        commandCenter.playCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.audioPlayer.play()
            return .success
        }
        commandCenter.pauseCommand.addTarget { [weak self] (event) -> MPRemoteCommandHandlerStatus in
            self?.audioPlayer.pause()
            return .success
        }
    }
    func play(at value:Float){
        audioPlayer.playImmediately(atRate: value)
    }
    func play(){
        DispatchQueue.main.async {
            self.audioPlayer.play()
        }
       
    }
    func pause(){
        audioPlayer.pause()
    }
    func getRate() -> Float{
        return audioPlayer.rate
    }
    func getCurrentTime()->CMTime?{
        return audioPlayer.currentTime()
       
    }
    func getDuration()->CMTime?{
        return (audioPlayer.currentItem?.duration)
        
    }
    func getCurrentTime(completion:@escaping (CMTime,Error?)->Void){
        var value:CMTime = CMTime()
        do {
            value = try audioPlayer.currentTime()
            completion(value,nil)
        } catch {
            completion(value,error)
        }
    }
    func getDurationTime(completion:@escaping (CMTime,Error?)->Void){
        var value:CMTime = CMTime()
        do {
            value = (try audioPlayer.currentItem?.duration)!
            completion(value,nil)
        } catch {
            completion(value,error)
        }
    }
}
