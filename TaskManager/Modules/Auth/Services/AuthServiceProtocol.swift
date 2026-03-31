//
//  AuthServiceProtocol.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import Foundation

protocol AuthServiceProtocol {
    func signIn(email: String, password: String) async throws
    func signUp(email: String, password: String) async throws
}
