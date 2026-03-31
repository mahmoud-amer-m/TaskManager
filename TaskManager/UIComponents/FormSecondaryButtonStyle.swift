//
//  FormSecondaryButtonStyle.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 31.03.26.
//

import SwiftUI

struct FormSecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.black.opacity(configuration.isPressed ? 0.18 : 0.12))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(Color.white.opacity(0.16), lineWidth: 1)
            )
            .animation(.easeOut(duration: 0.18), value: configuration.isPressed)
    }
}
