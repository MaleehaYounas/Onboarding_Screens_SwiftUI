//
//  ContentView.swift
//  OnboardingScreens
//
//  Created by MAC on 29/07/2025.
//

import SwiftUI

struct ContentView: View {
    
    let data: [ViewData] = Data
    @State var currentPage:Int = 0
   
    
    var body: some View {
          TabView(selection: $currentPage) {
              ForEach(0..<data.count, id: \.self) { index in
                  OnboardingCard(data: data[index], currentPage: $currentPage)
            }
          }
          //.tabViewStyle(PageTabViewStyle())
          .ignoresSafeArea()
          .tabViewStyle(.page(indexDisplayMode: .never))
        }
}

#Preview {
    ContentView()
}
