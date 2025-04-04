//
//  UserListView.swift
//  UserManager
//
//  Created by Mauricio Rodriguez on 3/4/2025.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: UserListViewModel
    @State private var showingCreateView = false


    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Cargando usuarios...".localized)
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.users, id: \.id) { user in
                        NavigationLink(destination: UserDetailView(viewModel: UserDetailViewModel(user: user))) {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                Text(user.email).font(.caption)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Usuarios".localized)
            .onAppear {
                viewModel.loadUsers()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingCreateView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingCreateView, onDismiss: {
                viewModel.loadUsers()
            }) {
                CreateUserView()
            }

        }
    }
}
