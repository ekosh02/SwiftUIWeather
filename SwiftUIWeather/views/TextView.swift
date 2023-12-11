//
//  TextView.swift
//  SwiftUIWeather
//
//  Created by Yeldos Turapbayev on 12.12.2023.
//

import SwiftUI

struct TextView: View {
    var text: String = "Text"
    var fontSize: CGFloat = 16
    var fontWeight: Font.Weight = .regular
    var foreground: Color = .white
    var width: CGFloat? = nil
    var height: CGFloat? = nil
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize, weight: fontWeight))
            .foregroundStyle(foreground)
            .frame(width: width, height: height)
    }
}
