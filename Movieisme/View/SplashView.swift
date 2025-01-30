import SwiftUI

struct SplashView: View {
    
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var isActive = false // Track navigation state
    
    var body: some View {
        if isActive {
            
            SignInView()

        } else {
            VStack {
                ZStack {
                    Color.yellow1
                        .ignoresSafeArea()
                    Image("movieismelogo") // Use the name of your image asset
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.2)) {
                                self.size = 1.5
                                self.opacity = 1.0
                            }
                        }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        self.isActive = true // Switch to main view
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
