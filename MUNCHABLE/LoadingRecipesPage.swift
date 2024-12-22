//
//  LoadingRecipesPage.swift
// MUNCHABLE
//
import SwiftUI
import AVKit
import AVFoundation

struct PlayerView1: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView1>) { }
    
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
        
        guard let fileUrl = Bundle.main.url(forResource: "demoVideo2", withExtension: "mp4") else {
            print("Error: Video file not found. Ensure the file name and Target Membership are correct.")
            return
        }
        
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        
        let player = AVQueuePlayer()
        player.volume = 0 // تعطيل الصوت
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

struct LoadingRecipesPage: View {
    @State private var isLoading = false
    @State private var navigateToNextPage = false
    var body: some View {
        NavigationStack {
            ZStack {
                PlayerView1()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Circle()
                            .frame(width: 14, height: 14)
                            .foregroundColor(Color("green"))
                            .offset(y: isLoading ? -10 : 0)
                            .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.2), value: isLoading)
                        
                        Circle()
                            .frame(width: 14, height: 14)
                            .foregroundColor(Color("green"))
                            .offset(y: isLoading ? 0 : -10)
                            .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.4), value: isLoading)
                        
                        Circle()
                            .frame(width: 14, height: 14)
                            .foregroundColor(Color("green"))
                            .offset(y: isLoading ? -10 : 0)
                            .animation(.easeInOut(duration: 0.5).repeatForever().delay(0.6), value: isLoading)
                    }
                    .frame(width: 60, height: 10)
                    .onAppear {
                        withAnimation {
                            isLoading = true
                        }
                        startTimer()
                    }
                    
                    Spacer()
                }
            }
            .navigationDestination(isPresented: $navigateToNextPage) {
                RecipeFromAi()
            }
        }
    }
    
    private func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            navigateToNextPage = true // تفعيل التنقل بعد 7 ثوانٍ
        }
    }
}

#Preview {
    LoadingRecipesPage()
}
