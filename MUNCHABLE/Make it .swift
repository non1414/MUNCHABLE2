//
//  Make it .swift
//  MUNCHABLE
//
//  Created by نوف بخيت الغامدي on 29/03/1445 AH.
//

import SwiftUI
import AVKit
import AVFoundation


struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

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
        let fileUrl = Bundle.main.url(forResource: "demoVideo", withExtension: "mp4")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)

        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)

        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)

        // Start the movie
        player.play()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}


struct Make_it_: View {
    var body: some View {
       
        GeometryReader{ geo in
            ZStack {
                PlayerView()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height+100)
                    .overlay(Color.black.opacity(0.2))
                    .blur(radius: 1)
                .edgesIgnoringSafeArea(.all)

                VStack{
                    Text("Welcome to our world of culinary adventures! ")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Spacer()
                    Text("Get ready to explore mouthwatering recipes and elevate your cooking skills with Munchable ! ")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
            }
        }

    }
}

#Preview {
    Make_it_()
}
