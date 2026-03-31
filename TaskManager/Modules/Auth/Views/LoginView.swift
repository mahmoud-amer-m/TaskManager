//
//  LoginView.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        FormScreen(
            title: "Welcome back",
            subtitle: "Sign in to keep your tasks, focus blocks, and weekly plan in sync."
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
                textContentType: .password
            )

            Button {
                Task {
                    await viewModel.login()
                }
            } label: {
                Group {
                    if viewModel.isLoading {
                        ProgressView()
                            .tint(Color(red: 0.07, green: 0.16, blue: 0.22))
                    } else {
                        Text("Sign In")
                    }
                }
            }
            .buttonStyle(AuthPrimaryButtonStyle())
            .disabled(viewModel.isLoading)

            Button("Create a new account") {
                viewModel.onRegisterTap?()
            }
            .buttonStyle(FormSecondaryButtonStyle())
            .disabled(viewModel.isLoading)

            if let error = viewModel.errorMessage {
                FormErrorBanner(message: error)
            }
        }
    }
}
