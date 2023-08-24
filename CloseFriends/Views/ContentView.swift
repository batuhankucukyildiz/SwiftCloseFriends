//
//  ContentView.swift
//  CloseFriends
//
//  Created by Batuhan Küçükyıldız on 24.08.2023.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var users = UsersViewModel()
    @State var isLoading = true
    
    var body: some View {
        if users.users.isEmpty && isLoading {
            ScrollView {
                LazyVStack(spacing: 1) {
                    ForEach(0..<5) { _ in
                        ContentLoader()
                    }
                }
            }
            .onAppear {
                // Simulate loading users
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                }
            }
        } else {
            List(users.users) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.username)
                        .font(.subheadline)
                    Text(user.email)
                        .font(.subheadline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
