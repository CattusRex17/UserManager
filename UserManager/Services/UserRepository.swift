//
//  UserRepository.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//

import Foundation

class UserRepository {
    private let userDefaultsKey = "users"

    func saveUser(_ user: User) {
        var currentUsers = getAllUsers()
        
        // Si ya existe, lo reemplazamos
        if let index = currentUsers.firstIndex(where: { $0.id == user.id }) {
            currentUsers[index] = user
        } else {
            currentUsers.append(user)
        }
        
        saveToUserDefaults(users: currentUsers)
    }

    func getAllUsers() -> [User] {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else {
            return []
        }
        do {
            return try JSONDecoder().decode([User].self, from: data)
        } catch {
            print("Error al decodificar usuarios: \(error)")
            return []
        }
    }

    func deleteUser(by id: Int) {
        var currentUsers = getAllUsers()
        currentUsers.removeAll(where: { $0.id == id })
        saveToUserDefaults(users: currentUsers)
    }

    func saveUsersFromAPI(_ users: [User]) {
        var existingUsers = getAllUsers()
        let newUsers = users.filter { newUser in
            !existingUsers.contains(where: { $0.id == newUser.id })
        }
        existingUsers.append(contentsOf: newUsers)
        saveToUserDefaults(users: existingUsers)
    }

    private func saveToUserDefaults(users: [User]) {
        do {
            let data = try JSONEncoder().encode(users)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        } catch {
            print("Error al guardar usuarios en UserDefaults: \(error)")
        }
    }
}

