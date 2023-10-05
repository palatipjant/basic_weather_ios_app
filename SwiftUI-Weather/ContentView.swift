//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Palatip Jantawong on 30/9/2566 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    var DaysOfWeek = [
        ["days":"TUE","img_day":"cloud.sun.fill","img_night":"cloud.moon.fill", "temp":"32"],
        ["days":"WEN","img_day":"sun.max.fill","img_night":"moon.fill", "temp":"34"],
        ["days":"THU","img_day":"wind.snow","img_night":"cloud.moon.rain.fill", "temp":"17"],
        ["days":"FRI","img_day":"sunset.fill","img_night":"moonrise.fill", "temp":"27"],
        ["days":"SAT","img_day":"snow","img_night":"moon.zzz.fill", "temp":"16"]
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(CityName: "Bangkok, TH")
                
                MainWeatherStatusView(image_name: isNight ? "cloud.moon.bolt.fill" : "cloud.sun.fill", temperature: isNight ? 25 : 35)
                // isNight ? days["img_night] : days["img_day"]
                HStack(spacing:18) {
                    ForEach(DaysOfWeek, id: \.self) { days in
                        if isNight {
                            WeatherDaysView(DaysOfWeek: days["days"] ?? "unknown", image_name: days["img_night"] ?? "cloud.fill", temperature: days["temp"] ?? "Unknown Temp")
                        } else if isNight == false{
                            WeatherDaysView(DaysOfWeek: days["days"] ?? "unknown", image_name: days["img_day"] ?? "cloud.fill", temperature: days["temp"] ?? "Unknown Temp")
                        }
                    }
                }
                
                Spacer()
                
                
                Button(
                    action: {
                        isNight.toggle()
                    },
                    label: {
                        WeatherButton(title: "Change Days Time", textcolor: .blue, background: .white)
                    }
                )
                Spacer()
            }
        }
    }
}


#Preview {
    ContentView()
}

struct WeatherDaysView: View {
    var DaysOfWeek:String
    var image_name:String
    var temperature:String
    
    var body: some View {
        VStack{
            Text(DaysOfWeek)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color.white)
            Image(systemName: image_name)
                .symbolRenderingMode(.multicolor )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature) C")
                .font(.system(size: 26, weight: .medium))
                .foregroundStyle(Color.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors:
                                            [isNight ? .black : .blue , isNight ? .gray : Color("lighterblue")]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View{
    var CityName:String
    
    var body: some View{
        Text(CityName)
            .font(.largeTitle)
            .fontDesign(.default)
            .fontWeight(.medium)
            .foregroundStyle(.white)
            .padding(40)
    }
}

struct MainWeatherStatusView: View {
    
    var image_name:String
    var temperature:Int
    
    var body: some View{
        VStack(spacing: 10) {
            Image(systemName: image_name)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)")
                .font(.system(size: 78, weight: .medium))
                .foregroundStyle(Color.white)
        }.padding(.bottom, 40)
    }
}

 
