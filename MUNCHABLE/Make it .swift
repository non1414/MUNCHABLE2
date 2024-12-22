//
//  Make it .swift
//  MUNCHABLE
//
//  Created by نوف بخيت الغامدي on 29/03/1445 AH.

import SwiftUI
import AVKit
import AVFoundation

struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {}
    
    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Load the resource
        guard let fileUrl = Bundle.main.url(forResource: "demoVideo", withExtension: "mp4") else {
            print("Error: Video file not found!")
            return
        }
        
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        
        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        
        player.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

struct Make_it_: View {
    var body: some View {
        NavigationStack {
            ZStack {
                PlayerView()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    // محتوى النصوص
                    VStack(spacing: 16) {
                        Text(NSLocalizedString("welcome_message", comment: ""))
                            .font(
                                Font.custom("SF Pro Text", size: 30)
                                    .weight(.semibold)
                            )
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                        
                        Text(NSLocalizedString("description_message", comment: ""))
                            .font(Font.custom("SF Pro Text", size: 20))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                    }
                    
                    Spacer()
                    
                    // زر البداية
                    NavigationLink(destination: CategorysPage()) {
                        Text(NSLocalizedString("start_button", comment: ""))
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("green"))
                            .cornerRadius(10)
                            .padding(.horizontal, 50)
                    }
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

#Preview {
    Make_it_()
}
