//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Yeldos Turapbayev on 12.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    private let WeatherHourList: [(id: Int, hour: String, icon: String, temperature: String)] = [
        (1,"Now", "cloud.fog.fill", "-7°"),
        (2, "2am", "snowflake", "-8°"),
        (3, "3am", "snowflake", "-8°"),
        (4, "4am", "moon.haze.fill", "-9°"),
        (5, "5am", "moon.haze.fill", "-9°"),
        (6,"6am", "moon.haze.fill", "-10°"),
        (7,"7am", "moon.haze.fill", "-10°"),
        (8,"8am", "moon.haze.fill", "-11°"),
        (9,"8:14am", "sunrise.fill", "Sunrise"),
        (10, "9am", "sun.haze.fill", "-11"),
        (11, "10am", "sun.haze.fill", "-11°"),
        (12, "11am", "sun.haze.fill", "-11°"),
        (13, "12pm", "sun.haze.fill", "-11°"),
        (14, "12pm", "sun.haze.fill", "-12°"),
        (15, "1pm", "sun.haze.fill", "-12°"),
        (16, "2pm", "sun.haze.fill", "-12°"),
        (17, "3pm", "moon.haze.fill", "-13°"),
        (18, "4pm", "moon.haze.fill", "-13°"),
        (19, "5pm", "moon.haze.fill", "-14°"),
        (20, "5:17pm", "sunset.fill", "Sunset°"),
        (21, "6pm", "moon.haze.fill", "-15°"),
        (22, "7pm", "moon.haze.fill", "-15°"),
        (23, "8pm", "moon.haze.fill", "-16°"),
        (24, "9pm", "moon.haze.fill", "-17°"),
        (25, "10pm", "cloud.fill", "-18°"),
        (26, "11pm", "cloud.moon.fill", "-18°"),
        (27, "12am", "cloud.moon.fill", "-19°"),
        (28, "1am", "cloud.moon.fill", "-20°"),
        (29, "2am", "moon.stars.fill", "-21°"),
    ]
    
    private let WeatherDayList: [(id: Int, day: String, icon: String, nightTemperature: String, dayTemperature: String)] = [
        (1,"Today", "snowflake", "-19°", "-7°"),
        (2, "Wed", "sun.haze.fill", "-22°", "-13°"),
        (3, "Thu", "sun.haze.fill", "-17°", "-6°"),
        (4, "Fri", "cloud.sun.fill", "-10°", "-0°"),
        (5, "Sat", "cloud.fill", "-2°", "-2°"),
        (6, "Sun", "cloud.sun.fill", "-4°", "-2°"),
        (7, "Mon", "cloud.fill", "-3°", "-4°"),
        (8, "Thu", "cloud.sun.fill", "0°", "-4°"),
        (9, "Wen", "cloud.fill", "-2°", "-8°"),
        (10, "Thu", "snowflake", "-2°", "-6°"),
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .dark1 : .blue, bottomColor: isNight ? .dark2 : .white)
            VStack {
                HStack {
                    Image(systemName: "").frame(width: 50, height: 50)
                    Spacer()
                    VStack {
                        TextView(text: "My location", fontSize: 38, fontWeight: .regular)
                        TextView(text: "Almaty", fontSize: 18, fontWeight: .medium)
                    }
                    Spacer()
                    NightToggleButton(isNight: $isNight)
                }
                
                ScrollView {
                    TextView(text: "-7°", fontSize: 92, fontWeight: .thin)
                    TextView(text: "Fog", fontSize: 20)
                    TextView(text: "H:-7° L:-19°", fontSize: 20)
                    VStack(alignment: .leading) {
                        TextView(text: "Showy conditions from 2am-5am, with hazy conditions expected at 5am.", fontWeight: .medium)
                            .padding(.horizontal, 13)
                            .padding(.bottom, 10)
                        ScrollView (.horizontal) {
                            HStack () {
                                ForEach(WeatherHourList, id: \.id) { element in
                                    WeatherHourView(hour: element.hour, icon: element.icon, temperature: element.temperature)
                                }
                            }
                        }
                    }
                    .frame(width: WIDTH - 32)
                    .padding(.vertical, 13)
                    .background(isNight ? .black.opacity(0.2) : .black.opacity(0.4))
                    .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "calendar")
                                .renderingMode(.template)
                                .resizable()
                                .foregroundColor(isNight ? .gray : .white.opacity(0.8))
                                .frame(width: 24, height: 24)
                            TextView(text: "10-DAY FORECAST", fontWeight: .medium, foreground: isNight ? .gray : .white.opacity(0.8))
                        }
                        .padding(.bottom, 10)
                        
                        
                        ForEach(WeatherDayList, id: \.id) { element in
                            WeatherDayView(day: element.day, icon: element.icon, nightTemperature: element.nightTemperature, dayTemperature: element.nightTemperature)
                        }
                    }
                    .frame(width: WIDTH - 32)
                    .padding(.vertical, 13)
                    .background(isNight ? .black.opacity(0.2) : .black.opacity(0.4))
                    .cornerRadius(10)
                }
                
            }
            
        }
    }
}

struct WeatherHourView: View {
    var hour: String
    var icon: String
    var temperature: String
    
    var body: some View {
        VStack {
            TextView(text: hour, fontWeight: .medium)
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            TextView(text: temperature, fontSize: 20, fontWeight: .medium)
        }.padding(.horizontal, 13)
    }
}

struct WeatherDayView: View {
    var day: String
    var icon: String
    var nightTemperature: String
    var dayTemperature: String
    
    var body: some View {
        HStack {
            TextView(text: day, fontSize: 22, fontWeight: .medium).frame(width: 72)
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            TextView(text: nightTemperature, fontSize: 20, fontWeight: .medium).frame(width: 42)
            TextView(text: "------------")
            TextView(text: dayTemperature, fontSize: 20, fontWeight: .medium).frame(width: 42)
        }
    }
}

#Preview {
    ContentView()
}
