//
//  AuthService.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import FirebaseAuth

final class AuthService: AuthServiceProtocol {
    func signIn(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }

    func signUp(email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
}
