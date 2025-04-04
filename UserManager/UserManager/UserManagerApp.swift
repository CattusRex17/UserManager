//
//  UserManagerApp.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//

import SwiftUI

@main
struct UserManagerApp: App {
    @StateObject private var mainCoordinator = MainCoordinator()

    var body: some Scene {
        WindowGroup {
            mainCoordinator.start()
        }
    }
}

