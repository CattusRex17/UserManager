//
//  UserListViewModel.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository = UserRepository()

    func loadUsers() {
        isLoading = true
        Task {
            do {
                let apiUsers = try await UserService.shared.fetchUsers()
                repository.saveUsersFromAPI(apiUsers)

                await MainActor.run {
                    self.users = repository.getAllUsers()
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = "load_users_error".localized + " \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }

    func deleteUser(id: Int) {
        repository.deleteUser(by: id)
        users = repository.getAllUsers()
    }
}
