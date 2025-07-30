//
//  OnboardingCard.swift
//  OnboardingScreens
//
//  Created by MAC on 29/07/2025.
//

import SwiftUI

struct OnboardingCard: View {
    var data:ViewData
    @Binding var currentPage:Int
    @State var isAnimating:Bool = false
    
    var body: some View {

            GeometryReader { geometry in
                let minDim = min(geometry.size.width, geometry.size.height)
                let isPortrait = geometry.size.width < geometry.size.height
                ZStack {
                    // Background color
                    Color(data.color).ignoresSafeArea()
                    
                    if isPortrait{
                        VStack(spacing: minDim * 0.07) {
                            Spacer()
                            // Image
                            ImageView(Dim: minDim).onAppear(perform: {
                                isAnimating = true
                            })
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
                        }.ignoresSafeArea()
                    }
                }
                .onAppear(){
                    isAnimating = true
                }
                .onDisappear(){
                    isAnimating = false
                }
            }
    }
    
    func ImageView(Dim:Double) -> some View {
       
            Image(data.image)
                .resizable()
                .scaledToFit()
                .frame(height: Dim * 0.85)
                .scaleEffect(isAnimating ? 1 : 0.5)
                .animation(.easeInOut(duration: 0.5), value: isAnimating)
    }
    
    
    func Title(Dim:Double) -> some View{
        Text(data.title)
            .font(.custom("CrimsonText-Bold", size: Dim * 0.11))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.horizontal)
    }
    
    func Description(Dim:Double) -> some View{
        Text(data.description)
            .font(.custom("CrimsonText-Regular", size: Dim * 0.06))
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
            .padding(.horizontal, Dim * 0.08)
    }
    
//    func PageIndicator(Dim: Double) -> some View {
//        HStack(spacing: 8) {
//            ForEach(0..<3) { index in
//                if index == currentPage {
//                    Capsule()
//                        .fill(Color.black)
//                        .frame(width: Dim * 0.035, height: Dim * 0.02)
//                        
//                } else {
//                    Circle()
//                        .fill(Color.white)
//                        .frame(width: Dim * 0.02)
//                }
//            }
//        }
//    }

    func PageIndicator(Dim: Double) -> some View {
        let totalPages = 3
        let spacing: CGFloat = 9
        let dotSize = Dim * 0.02
        let capsuleWidth = Dim * 0.035
        let capsuleHeight = Dim * 0.02

        return ZStack(alignment: .leading) {
            
            HStack(spacing: spacing) {
                ForEach(0..<totalPages, id: \.self) { _ in
                    Circle()
                        .fill(Color.white)
                        .frame(width: dotSize)
                }
            }

            Capsule()
                .fill(Color.black)
                .frame(width: capsuleWidth, height: capsuleHeight)
                .offset(x: CGFloat(currentPage) * (dotSize + spacing))
                .animation(.easeInOut(duration: 0.3), value: currentPage)
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
        Button {
            if currentPage<=1
            {
                currentPage+=1
            }
        } label: {
            Text("Next")
                .font(.custom("CrimsonText-Regular", size: Dim * 0.045))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(6)
        }

        
    }
    
    func StartButton(Dim:Double) -> some View{
        Button {
           
        } label: {
            Text("Let's Start")
                .font(.custom("CrimsonText-Regular", size: Dim * 0.045))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(6)
        }
        .padding(.horizontal, Dim * 0.08)

        
    }
    
    func Details(Dim:Double) -> some View{
        Group{
            // Title
            Title(Dim: Dim)
            // Description
            Description(Dim:Dim)
            // Page Indicator
            PageIndicator(Dim:Dim)
            if currentPage == 2{
                StartButton(Dim:Dim)
            }
            else
            {
                HStack(spacing: 20) {
                    SkipButton(Dim:Dim)
                    NextButton(Dim:Dim)
                    
                }
                .padding(.horizontal, Dim * 0.08)
            }
        }
    }

}
