//
//  FormBackdropShape.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 31.03.26.
//


import SwiftUI

struct FormBackdropShape: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white.opacity(0.12))
                .frame(width: 220)
                .blur(radius: 4)
                .offset(x: -130, y: -260)

            Circle()
                .fill(Color(red: 1.0, green: 0.82, blue: 0.62).opacity(0.22))
                .frame(width: 260)
                .blur(radius: 10)
                .offset(x: 160, y: -150)

            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .fill(Color.white.opacity(0.08))
                .frame(width: 180, height: 180)
                .rotationEffect(.degrees(18))
                .offset(x: 140, y: 280)
        }
        .ignoresSafeArea()
    }
}
