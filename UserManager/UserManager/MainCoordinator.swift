//
//  MainCoordinator.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//

import SwiftUI

class MainCoordinator: ObservableObject {
    func start() -> some View {
        UserListView(viewModel: UserListViewModel())
    }
}
