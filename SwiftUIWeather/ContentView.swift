//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Yeldos Turapbayev on 12.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .dark1, bottomColor: .dark2)
            TextView()
        }
    }
}

#Preview {
    ContentView()
}
