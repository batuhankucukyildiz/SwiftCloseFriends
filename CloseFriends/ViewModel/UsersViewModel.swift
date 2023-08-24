//
//  UsersViewModel.swift
//  CloseFriends
//
//  Created by Batuhan Küçükyıldız on 24.08.2023.
//

import Foundation


class UsersViewModel :ObservableObject {
    
    @Published var users : [Users] = []
    init(){
        getUsers()
    }
    func getUsers() {
        NetworkManager.shared.getUsers{ result in
                switch result {
                    case .success(let data):
                        self.users = data
                    case .failure(let error):
                        print("Error fetching data: \(error)")
                }
            }
        }
}
