//
//  RootView.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var session: SessionManager

    var body: some View {
        Group {
            if session.isAuthenticated {
                TasksListView()
            } else {
                AuthRootView()
            }
        }
    }
}
