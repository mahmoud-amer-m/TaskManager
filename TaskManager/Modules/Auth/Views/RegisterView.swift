//
//  RegisterView.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel: RegisterViewModel

    init(viewModel: RegisterViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        FormScreen(
            title: "Create account",
            subtitle: "Build your workspace for tasks, routines, and the work that matters next."
        ) {
            InputField(
                title: "Email",
                icon: "envelope.fill",
                text: $viewModel.email,
                keyboardType: .emailAddress,
                textContentType: .emailAddress
            )

            InputField(
                title: "Password",
                icon: "lock.fill",
                text: $viewModel.password,
                isSecure: true,
                textContentType: .newPassword
            )

            InputField(
                title: "Confirm Password",
                icon: "checkmark.shield.fill",
                text: $viewModel.confirmPassword,
                isSecure: true,
                textContentType: .newPassword
            )

            Button {
                Task {
                    await viewModel.register()
                }
            } label: {
                Group {
                    if viewModel.isLoading {
                        ProgressView()
                            .tint(Color(red: 0.07, green: 0.16, blue: 0.22))
                    } else {
                        Text("Create Account")
                    }
                }
            }
            .buttonStyle(AuthPrimaryButtonStyle())
            .disabled(viewModel.isLoading)

            if let error = viewModel.errorMessage {
                FormErrorBanner(message: error)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}
