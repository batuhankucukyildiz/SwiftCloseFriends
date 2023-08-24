//
//  ContentView.swift
//  CloseFriends
//
//  Created by Batuhan Küçükyıldız on 24.08.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var users = UsersViewModel()
    
    var body: some View {
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
