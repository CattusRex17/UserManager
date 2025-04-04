//
//  UserDetailViewModel.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//

import Foundation

class UserDetailViewModel: ObservableObject {
    @Published var user: User

    private let repository = UserRepository()

    init(user: User) {
        self.user = user
    }

    func saveChanges() {
        repository.saveUser(user)
    }

    func deleteUser() {
        repository.deleteUser(by: user.id)
    }
}


