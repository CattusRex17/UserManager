//
//  CreateUserViewModel.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//

import Foundation
import CoreLocation
import SwiftUI

class CreateUserViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var name = ""
    @Published var email = ""
    @Published var phone = ""
    @Published var username = ""
    @Published var location: CLLocationCoordinate2D?

    private var locationManager: CLLocationManager?
    private let repository = UserRepository()

    var isFormValid: Bool {
        !name.isEmpty && ValidationService.isValidEmail(email) && !phone.isEmpty
    }

    func saveUser() {
        let newUser = User(
            id: Int(Date().timeIntervalSince1970),
            name: name,
            username: username,
            email: email,
            phone: phone,
            address: Address(
                city: "current_location".localized,
                latitude: location?.latitude,
                longitude: location?.longitude
            )
        )

        repository.saveUser(newUser)
    }

    func requestLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.requestLocation()
    }

    @objc func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.location = location.coordinate
        }
    }

    @objc func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
}


