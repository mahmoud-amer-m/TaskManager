//
//  InputField.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 31.03.26.
//

import SwiftUI

struct InputField: View {
    let title: String
    let icon: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var textContentType: UITextContentType?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.caption.weight(.semibold))
                .foregroundStyle(Color.white.opacity(0.92))

            HStack(spacing: 12) {
                Image(systemName: icon)
                    .foregroundStyle(Color.white.opacity(0.78))
                    .frame(width: 18)

                Group {
                    if isSecure {
                        SecureField(title, text: $text)
                    } else {
                        TextField(title, text: $text)
                    }
                }
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .keyboardType(keyboardType)
                .textContentType(textContentType)
                .foregroundStyle(.white)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.white.opacity(0.12))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(Color.white.opacity(0.14), lineWidth: 1)
            )
        }
    }
}
