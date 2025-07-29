import SwiftUI

struct OnboardingView2: View {
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        
       
            
        GeometryReader { geometry in
            let minDim = min(geometry.size.width, geometry.size.height)
            let isPortrait = geometry.size.width < geometry.size.height
 
                ZStack {
                    // Background color
                    Color("ScreenBg2").ignoresSafeArea()
                    
                    if isPortrait{
                        VStack(spacing: minDim * 0.07) {
                            // Image
                            ImageView(Dim: minDim)
                            Details(Dim:minDim)
                            Spacer(minLength: minDim * 0.07)
                        }
                    }
                    else{
                        
                        HStack(spacing: minDim * 0.03) {
                            Spacer(minLength: minDim * 0.05)
                            // Image
                            ImageView(Dim: minDim)
                            VStack(spacing: minDim * 0.07){
                                Details(Dim:minDim)
                            }
                        }
                    }
                }
          }
    }
    
    func ImageView(Dim:Double) -> some View {
        Image("Images/Gardening")
            .resizable()
            .scaledToFit()
            .frame(height: Dim * 0.85)
    }
    
    func Title(Dim:Double) -> some View{
        Text("Find Hobbies")
            .font(.custom("CrimsonText-Bold", size: Dim * 0.11))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.horizontal)
    }
    
    func Description(Dim:Double) -> some View{
        Text("Connect with people with similar hobbies in your city. Just add your activities and meet with them!")
            .font(.custom("CrimsonText-Regular", size: Dim * 0.06))
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
            .padding(.horizontal, Dim * 0.08)
    }
    
    func PageIndicator(Dim:Double) -> some View{
        HStack(spacing: 8) {
            Circle()
                .fill(Color.white)
                .frame(width: Dim * 0.02)
            Capsule()
                .fill(Color.black)
                .frame(width: Dim * 0.035, height: Dim * 0.02)
            Circle()
                .fill(Color.white)
                .frame(width: Dim * 0.02)
        }
    }
    
    func SkipButton(Dim:Double) -> some View{
        
            Text("Skip")
                .font(.custom("CrimsonText-Regular", size: Dim * 0.045))
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.clear)
                .foregroundColor(.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 1)
                )
    }
    
    func NextButton(Dim:Double) -> some View{
        
            Text("Next")
                .font(.custom("CrimsonText-Regular", size: Dim * 0.045))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(6)
    }
    
    func Details(Dim:Double) -> some View{
        Group{
            // Title
            Title(Dim: Dim)
            // Description
            Description(Dim:Dim)
            // Page Indicator
            PageIndicator(Dim:Dim)
            HStack(spacing: 20) {
                SkipButton(Dim:Dim)
                NavigationLink {
                    OnboardingView3()
                } label: {
                   NextButton(Dim:Dim)
                }
            }
            .padding(.horizontal, Dim * 0.08)
        }
    }
}
