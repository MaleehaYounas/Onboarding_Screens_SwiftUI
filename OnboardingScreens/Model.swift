//
//  Model.swift
//  OnboardingScreens
//
//  Created by MAC on 29/07/2025.
//

import Foundation

struct ViewData: Identifiable{
    var id = UUID()
    var title:String = ""
    var image:String = ""
    var description:String = ""
    var color:String = ""
    
    init(title: String, image: String, description: String, color: String) {
        self.title = title
        self.image = image
        self.description = description
        self.color = color
    }
    
}


let Data: [ViewData] = [
    ViewData(
        title: "Hobbies Are Fun!" ,
        image: "Images/VideoGames",
        description: "Connect with people with similar hobbies in your city. Just add your activities and meet with them!" ,
        color: "ScreenBg1"
    ),
    ViewData(
        title: "Find Hobbies" ,
        image: "Images/Gardening",
        description: "Connect with people with similar hobbies in your city. Just add your activities and meet with them!" ,
        color: "ScreenBg2"
    ),
    ViewData(
        title: "5 Hobbies Nearby!" ,
        image: "Images/Work",
        description: "Connect with people with similar hobbies in your city. Just add your activities and meet with them!" ,
        color: "ScreenBg3"
    ),

   ]
