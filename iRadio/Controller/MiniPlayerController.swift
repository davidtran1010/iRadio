//
//  PlayerController.swift
//  chiasenhac
//
//  Created by DavidTran on 3/6/18.
//  Copyright © 2018 DavidTran. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import MediaPlayer

struct PlayerState {
    static let waitLoading = "wait"
    static let Loaded = "loaded"
}

protocol MiniPlayerDelegate: class {
    func expandSong()
}
protocol PlayAudioDelegate:class {
    func play(channelName:String,logo:UIImage, urlString:String)
}
protocol PlayNextDelegate:class {
    func updateNextSong()
}

class MiniPlayerController:UIViewController,PlayAudioDelegate{
    
   
    //    @IBOutlet weak var lbSongName: UILabel!
//    @IBOutlet weak var btnNext: UIButton!
//    @IBOutlet weak var btnPrevious: UIButton!
//    @IBOutlet weak var lbSongQuality: UILabel!
//    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
//    @IBOutlet weak var self.miniPlayerView!.progressBar: UIProgressView!
//    @IBOutlet weak var self.miniPlayerView!.btnPlay: UIButton!
    
//    @IBOutlet weak var self.miniPlayerView!.thumbImage: UIImageView!
    
    var delegate:MiniPlayerDelegate!
    var isPlaying = false
    
    var isPlayAuto = true
    var miniPlayerView:MiniPlayerView?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
   
    func updatePlayPauseButtonState(){
        if AudioPlayer.shared.getRate()>0{
            
            UIView.animate(withDuration: 0.7, delay: 0, options: [.curveEaseIn], animations: {
                self.miniPlayerView!.btnPlay.setBackgroundImage(#imageLiteral(resourceName: "pause_icon"), for: .normal)
            }, completion: { (finished) in
                
            })
        }else{
            UIView.animate(withDuration: 0.7, delay: 0, options: [.curveEaseIn], animations: {
                self.miniPlayerView!.btnPlay.setBackgroundImage(#imageLiteral(resourceName: "mini_play_icon"), for: .normal)
            }, completion: { (finished) in
                
            })
            
        }
    }

    override func viewDidLoad() {
        UserDefaults.standard.set(false, forKey: "playing_shuffle")
        
        setupUI()
        updatePlayPauseButtonState()
        
    }

    
    func setupUI(){
        
        
        miniPlayerView = Bundle.main.loadNibNamed("MiniPlayerView", owner: self, options: nil)?.first as! MiniPlayerView

       
        self.view = miniPlayerView!
        
        miniPlayerView?.frame = self.view.frame
        
        self.view.layoutIfNeeded()

        self.view.backgroundColor = UIColor.init(white: 0.92, alpha: 0.8)
        self.miniPlayerView!.btnPlay.addTarget(self, action: #selector(onPlayAndPause(_:)), for: .touchUpInside)
        
        self.miniPlayerView!.thumbImage.layer.masksToBounds = true
    }
    func changeUIState(with state:String){
        switch state {
        case PlayerState.Loaded:
            DispatchQueue.main.async {
                self.miniPlayerView!.btnPlay.isHidden = false
                self.miniPlayerView!.btnPlay.setBackgroundImage(#imageLiteral(resourceName: "pause_icon"), for: .normal)
                self.miniPlayerView!.playingIndicator.startAnimating()
            }

        case PlayerState.waitLoading:
            DispatchQueue.main.async {
                self.miniPlayerView!.btnPlay.isHidden = true
            
                
            }

        default:
            self.miniPlayerView!.btnPlay.isHidden = true

        }
    }
    @objc func onPlayAndPause(_ sender: UIButton) {
        
        if AudioPlayer.shared.getRate() > 0{
            AudioPlayer.shared.pause()
            sender.setBackgroundImage(#imageLiteral(resourceName: "mini_play_icon"), for: .normal)
            (self.view as! MiniPlayerView).playingIndicator.stopAnimating()
            isPlaying = false
        }
        else{
            AudioPlayer.shared.play()
            sender.setBackgroundImage(#imageLiteral(resourceName: "pause_icon"), for: .normal)
            (self.view as! MiniPlayerView).playingIndicator.startAnimating()
            isPlaying = true
        }
    }
    func play(channelName:String,logo:UIImage, urlString:String) {
        changeUIState(with: PlayerState.Loaded)
        
        print("playing link: \(urlString)")
        
        (self.view as! MiniPlayerView).thumbImage.image = logo
        (self.view as! MiniPlayerView).lbSongName.text = channelName

        AudioPlayer.shared.setURL(urlString: urlString,completion: {
            AudioPlayer.shared.setupCommandCenter(channelName: channelName)
            AudioPlayer.shared.play()
            AudioPlayer.shared.isTimeOut = false
        })
    }
    }


