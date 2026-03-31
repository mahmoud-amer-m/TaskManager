//
//  FormScreen.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 31.03.26.
//

import SwiftUI

struct FormScreen<Content: View>: View {
    let title: String
    let subtitle: String
    @ViewBuilder let content: Content

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.10, blue: 0.18),
                    Color(red: 0.07, green: 0.24, blue: 0.29),
                    Color(red: 0.93, green: 0.55, blue: 0.30)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            FormBackdropShape()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("TaskFlow")
                            .font(.caption.weight(.semibold))
                            .foregroundStyle(.white.opacity(0.8))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(.white.opacity(0.14), in: Capsule())

                        Text(title)
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)

                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.82))
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    VStack(alignment: .leading, spacing: 18) {
                        content
                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 28, style: .continuous)
                            .fill(.ultraThinMaterial)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 28, style: .continuous)
                            .stroke(.white.opacity(0.22), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.15), radius: 22, x: 0, y: 20)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 40)
            }
        }
    }
}
