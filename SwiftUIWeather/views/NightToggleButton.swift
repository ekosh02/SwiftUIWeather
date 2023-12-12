//
//  darkModeButton.swift
//  SwiftUIWeather
//
//  Created by Yeldos Turapbayev on 12.12.2023.
//

import SwiftUI

struct NightToggleButton: View {
    @Binding var isNight: Bool

    var body: some View {
        Button(action: {
            self.isNight.toggle()
        }) {
            ZStack {
                Image(systemName: isNight ? "circle.lefthalf.filled" : "circle.righthalf.filled")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(isNight ? .black : .white)
                    .frame(width: 28, height: 28)
                    .cornerRadius(14)
                Image(systemName:  isNight ? "circle.righthalf.filled" : "circle.lefthalf.filled")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(isNight ? .black : .white)
                    .frame(width: 14, height: 14)
                    .background(isNight ? .white : .blue)
                    .cornerRadius(7)
            }
        }
        .frame(width: 42, height: 42)
        .background(isNight ? .white : .black.opacity(0.3))
        .cornerRadius(8)
        .padding(8)
    }
}
