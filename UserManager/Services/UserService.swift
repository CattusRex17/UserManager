//
//  UserService.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//
import Alamofire

class UserService {
    static let shared = UserService()
    private init() {}

    func fetchUsers() async throws -> [User] {
        let url = "https://jsonplaceholder.typicode.com/users"
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url)
                .validate()
                .responseDecodable(of: [User].self) { response in
                    switch response.result {
                    case .success(let users):
                        continuation.resume(returning: users)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}

