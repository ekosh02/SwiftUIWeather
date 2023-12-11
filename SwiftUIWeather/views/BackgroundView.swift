//
//  BackgroundView.swift
//  SwiftUIWeather
//
//  Created by Yeldos Turapbayev on 12.12.2023.
//

import SwiftUI

struct BackgroundView: View {
    let topColor: Color
    let bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .top,
                       endPoint: .bottom)
        .ignoresSafeArea(.all
        )
    }
}
