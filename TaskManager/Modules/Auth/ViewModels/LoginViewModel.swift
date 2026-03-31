//
//  LoginViewModel.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import Combine
import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let authService: AuthServiceProtocol
    var onLoginSuccess: (() -> Void)?
    let onRegisterTap: (() -> Void)?

    init(authService: AuthServiceProtocol, onRegisterTap: @escaping () -> Void) {
        self.authService = authService
        self.onRegisterTap = onRegisterTap
    }
    
    func login() async {
        defer { isLoading = false }
        
        isLoading = true
        errorMessage = nil
        
        do {
            try await authService.signIn(email: email, password: password)
            onLoginSuccess?()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
