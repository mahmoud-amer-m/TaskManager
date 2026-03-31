//
//  SessionManager.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import Combine
import FirebaseAuth

@MainActor
final class SessionManager: ObservableObject {

    // MARK: - Published State
    @Published private(set) var user: User?
    @Published private(set) var isAuthenticated: Bool = false

    // MARK: - Private
    private var authStateListenerHandle: AuthStateDidChangeListenerHandle?

    // MARK: - Init
    init() {
        observeAuthState()
    }

    deinit {
        if let handle = authStateListenerHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    // MARK: - Auth State Listener
    private func observeAuthState() {
        authStateListenerHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }

            self.user = user
            self.isAuthenticated = (user != nil)
        }
    }

    // MARK: - Logout
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Logout failed: \(error.localizedDescription)")
        }
    }
}
