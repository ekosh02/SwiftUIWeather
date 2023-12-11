//
//  TextView.swift
//  SwiftUIWeather
//
//  Created by Yeldos Turapbayev on 12.12.2023.
//

import SwiftUI

struct TextView: View {
    let text: String = "Text"
    let fontSize: CGFloat = 16
    let fontWeight: Font.Weight = .regular
    let foreground: Color = .white
    let width: CGFloat? = nil
    let height: CGFloat? = nil
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize, weight: fontWeight))
            .foregroundStyle(foreground)
            .frame(width: width, height: height)
    }
}
