//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Palatip Jantawong on 2/10/2566 BE.
//

import SwiftUI

struct WeatherButton: View{
    
    var title:String
    var textcolor:Color
    var background:Color
    
    var body: some View{
        Text(title)
                .frame(width: 280, height: 50)
                .background(background)
                .foregroundStyle(textcolor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
    }
}

#Preview {
    WeatherButton(title: "Text Title", textcolor: .white, background: .blue)
}
