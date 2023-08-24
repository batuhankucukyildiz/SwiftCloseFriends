//
//  ContentView.swift
//  CloseFriends
//
//  Created by Batuhan Küçükyıldız on 24.08.2023.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var viewModel = UsersViewModel()
    @State var isLoading = true
    @State private var isRefreshing = false  // Ekledik
    //MARK: 
    var body: some View {
        if viewModel.users.isEmpty && isLoading {
            ScrollView {
                LazyVStack(spacing: 1) {
                    ForEach(0..<5) { _ in
                        ContentLoader()
                    }
                }
                .frame(maxWidth: .infinity)  // Tam genişlikte görüntüle
            }
            .onAppear {
                // Simulate loading users
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isLoading = false
                }
            }
            .refreshable {
                // Pull-to-refresh işlevi
                 viewModel.getUsers()
            }
        } else {
            ScrollView {
                ForEach(viewModel.users) { user in
                    UserCard(user: user)
                }
                .padding(.horizontal)
            }
            .refreshable {
                // Pull-to-refresh işlevi
                 viewModel.getUsers()

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
