//
//  AuthCoordinator.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import Combine
import SwiftUI

@MainActor
final class AuthCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    private let authService: AuthServiceProtocol

    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }

    func showRegister() {
        path.append(AuthRoute.register)
    }

    func reset() {
        path = NavigationPath()
    }

    func makeLoginViewModel(onSuccess: @escaping () -> Void) -> LoginViewModel {
        let viewModel = LoginViewModel(authService: authService, onRegisterTap: showRegister)
        viewModel.onLoginSuccess = onSuccess
        return viewModel
    }

    func makeRegisterViewModel(onSuccess: @escaping () -> Void) -> RegisterViewModel {
        let viewModel = RegisterViewModel(authService: authService)
        viewModel.onRegisterSuccess = onSuccess
        return viewModel
    }
}

enum AuthRoute: Hashable {
    case register
}
