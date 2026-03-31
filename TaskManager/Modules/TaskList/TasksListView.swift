//
//  TasksListView.swift
//  TaskManager
//
//  Created by Mahmoud Amer on 27.03.26.
//

import SwiftUI

struct TasksListView: View {
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        Text("Tasks List View")

        Button("Logout") {
            session.logout()
        }
    }
}
