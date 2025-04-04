//
//  UserDetailView.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//

import SwiftUI

struct UserDetailView: View {
    @ObservedObject var viewModel: UserDetailViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Form {
            Section(header: Text("Información".localized)) {
                HStack {
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.blue)
                        .padding(.bottom)
                    Spacer()
                }
                TextField("Nombre".localized, text: $viewModel.user.name)
                Text("Usuario: \(viewModel.user.username)".localized)
                TextField("Correo".localized, text: $viewModel.user.email)
                    .keyboardType(.emailAddress)
                Text("Teléfono: \(viewModel.user.phone)".localized)
                Text("Ciudad: \(viewModel.user.address.city )".localized)
                if let lat = viewModel.user.address.latitude, let lon = viewModel.user.address.longitude {
                    Text("Latitud: \(lat)".localized)
                    Text("Longitud: \(lon)".localized)
                }
            }

            Section {
                Button("Guardar cambios".localized) {
                    viewModel.saveChanges()
                    dismiss()
                }
                .disabled(viewModel.user.name.isEmpty)

                Button("Eliminar usuario".localized, role: .destructive) {
                    viewModel.deleteUser()
                    dismiss()
                }
            }
        }
        .navigationTitle("Detalles".localized)
    }
}

