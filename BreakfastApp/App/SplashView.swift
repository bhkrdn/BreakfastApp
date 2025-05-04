import SwiftUI

struct SplashView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            // Use the same image as the launch screen
            Image("AppIcon_for_launchscreen")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text("BreakfastApp")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(Color("AccentColor"))
                .padding(.top, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AppBackground"))
        .onAppear {
            // Shorter delay and simpler code to avoid getting stuck
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isActive = false
            }
        }
    }
} 