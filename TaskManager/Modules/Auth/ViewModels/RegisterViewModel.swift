//
//  RegisterViewModel.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import Combine
import Foundation

@MainActor
class RegisterViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let authService: AuthServiceProtocol
    var onRegisterSuccess: (() -> Void)?

    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
    func register() async {
        defer { isLoading = false }
        guard validate() else { return } // TODO: show validation warnings
        
        isLoading = true
        errorMessage = nil
        do {
            try await authService.signUp(email: email, password: password)
            onRegisterSuccess?()
        } catch {
            print("Error: \(error)")
            errorMessage = error.localizedDescription
        }
    }
    
    private func validate() -> Bool {
        if email.isEmpty || password.isEmpty {
            errorMessage = "Please fill all fields"
            return false
        }
        
        if password != confirmPassword {
            errorMessage = "Passwords do not match"
            return false
        }
        
        if password.count < 6 {
            errorMessage = "Password must be at least 6 characters"
            return false
        }
        
        return true
    }
}
