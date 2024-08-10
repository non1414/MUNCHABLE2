////
////  LoadingRecipesPage.swift
////  MUNCHABLE
////
////  Created by نوف بخيت الغامدي on 30/03/1445 AH.
////

import SwiftUI
import AVKit
import AVFoundation


struct PlayerView1: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView1>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView1(frame: .zero)
    }
}


class LoopingPlayerUIView1: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Load the resource
        let fileUrl = Bundle.main.url(forResource: "demoVideo2", withExtension: "mp4")!
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



struct LoadingRecipesPage: View {
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            GeometryReader{ geo in
                ZStack {
                    PlayerView1()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height+100)
                        .overlay(Color.black.opacity(0.2))
                        .blur(radius: 1)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            VStack {
                Spacer()
                
                HStack {
                    Circle()
                        .frame(width: 14, height: 14)
                        .foregroundColor(Color("green"))
                        .offset(y: isLoading ? -10 : 0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.2))
                    
                    Circle()
                        .frame(width: 14, height: 14)
                        .foregroundColor(Color("green"))
                        .offset(y: isLoading ? 0 : -10)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.4))
                    
                    Circle()
                        .frame(width: 14, height: 14)
                        .foregroundColor(Color("green"))
                        .offset(y: isLoading ? -10 : 0)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.6))
                }
                .frame(width: 30, height: 10)
                .onAppear {
                    // Simulate a network request or data loading
                    simulateLoading()
                }
                
                Spacer()
            }
        }
        
        
    }
    private func simulateLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.isLoading = false
            }
        }
        
    }
    
}

#Preview {
    LoadingRecipesPage()
}
