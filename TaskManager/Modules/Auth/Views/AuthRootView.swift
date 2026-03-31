//
//  AuthRootView.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import SwiftUI

struct AuthRootView: View {
    @StateObject private var coordinator: AuthCoordinator

    @MainActor
    init() {
        _coordinator = StateObject(wrappedValue: AuthCoordinator(authService: AuthService()))
    }

    @MainActor
    init(coordinator: @autoclosure @escaping () -> AuthCoordinator) {
        _coordinator = StateObject(wrappedValue: coordinator())
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            createLoginView()
                .navigationDestination(for: AuthRoute.self) { route in
                    switch route {
                    case .register:
                        createRegisterView()
                    }
                }
        }
    }

    private func createLoginView() -> some View {
        LoginView(viewModel: coordinator.makeLoginViewModel(onSuccess: coordinator.reset))
    }

    private func createRegisterView() -> some View {
        RegisterView(viewModel: coordinator.makeRegisterViewModel(onSuccess: coordinator.reset))
    }
}
