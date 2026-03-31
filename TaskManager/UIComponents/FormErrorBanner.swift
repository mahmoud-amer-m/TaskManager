//
//  FormErrorBanner.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import SwiftUI

struct FormErrorBanner: View {
    let message: String

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(Color(red: 0.45, green: 0.10, blue: 0.08))

            Text(message)
                .font(.footnote.weight(.medium))
                .foregroundStyle(Color(red: 0.38, green: 0.08, blue: 0.08))
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(red: 1.0, green: 0.90, blue: 0.88))
        )
    }
}


