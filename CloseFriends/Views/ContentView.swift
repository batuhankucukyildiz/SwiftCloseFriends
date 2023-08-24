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
    var body: some View {
        if viewModel.users.isEmpty && isLoading {
            ScrollView {
                LazyVStack(spacing: 1) {
                    ForEach(0..<5) { _ in
                        ContentLoader()
                    }
                }
            }
            .onAppear {
                // Simulate loading users
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isLoading = false
                }
            }
        } else {
            ScrollView{
                    ForEach(viewModel.users){user in
                        UserCard(user: user)
                    }.padding(.horizontal)
                   
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
