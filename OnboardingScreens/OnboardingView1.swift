import SwiftUI

struct OnboardingView1: View {
    var body: some View {
        
        NavigationView{
        GeometryReader { geometry in
            let minDim = min(geometry.size.width, geometry.size.height)
            let isPortrait = geometry.size.width < geometry.size.height
                ZStack {
                    // Background color
                    Color("ScreenBg1").ignoresSafeArea()
                    
                    if isPortrait{
                        VStack(spacing: minDim * 0.07) {
                            Spacer()
                            // Image
                            ImageView(Dim: minDim)
                            Details(Dim:minDim)
                            Spacer(minLength: minDim * 0.06)
                        }
                    }
                    else{
                        HStack(spacing: minDim * 0.03) {
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
    }
    
    func ImageView(Dim:Double) -> some View {
        Image("Images/VideoGames")
            .resizable()
            .scaledToFit()
            .frame(height: Dim * 0.85)
    }
    
    
    func Title(Dim:Double) -> some View{
        Text("Hobbies Are Fun!")
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
            Capsule()
                .fill(Color.black)
                .frame(width: Dim * 0.035, height: Dim * 0.02)
            Circle()
                .fill(Color.white)
                .frame(width: Dim * 0.02)
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
                    OnboardingView2()
                } label: {
                    NextButton(Dim:Dim)
                }
            }
            .padding(.horizontal, Dim * 0.08)
        }
    }
}
