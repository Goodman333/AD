//
//  ADDetailViewController.swift
//  AD
//
//  Created by 佳哥无敌啦 on 2020/9/6.
//  Copyright © 2020 佳哥无敌啦. All rights reserved.
//

import UIKit
import AVKit
import SnapKit

class ADDetailViewController: UIViewController {
    var videoURL: URL?
    var imageURL: URL?
    var player: AVPlayer?
    
    init(ADVideoURL: URL?, ADImageURL: URL?) {
        super.init(nibName: nil, bundle: nil)
        
        videoURL = ADVideoURL
        imageURL = ADImageURL
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        guard let videoUrl = videoURL else {
            return
        }
        
        player = AVPlayer(url: videoUrl)
        let layer = AVPlayerLayer(player: player)
        layer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 2.0)
        view.layer.addSublayer(layer)
        
        let playButton = UIButton(type: .custom)
        view.addSubview(playButton)
        playButton.setTitle("播放", for: .normal)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        playButton.setTitleColor(.orange, for: .normal)
        playButton.addTarget(self, action: #selector(playClick), for: .touchUpInside)
        playButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 100, height: 100))
            $0.centerY.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    @objc
    func playClick() {
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player?.play()
        }
    }
}
