//
//  CreateUserView.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//

import SwiftUI

struct CreateUserView: View {
    @StateObject var viewModel = CreateUserViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nuevo Usuario".localized)) {
                    TextField("Nombre".localized, text: $viewModel.name)
                    TextField("Email".localized, text: $viewModel.email)
                        .keyboardType(.emailAddress)
                    TextField("Teléfono".localized, text: $viewModel.phone)
                        .keyboardType(.phonePad)
                }

                Section {
                    Button("Obtener Ubicación Actual".localized) {
                        viewModel.requestLocation()
                    }
                    if let location = viewModel.location {
                        Text("Latitud: \(location.latitude)".localized)
                        Text("Longitud: \(location.longitude)".localized)
                    }
                }

                Section {
                    Button("Guardar".localized) {
                        viewModel.saveUser()
                        dismiss()
                    }
                    .disabled(!viewModel.isFormValid)

                }
            }
            .navigationTitle("Crear Usuario".localized)
        }
    }
}

