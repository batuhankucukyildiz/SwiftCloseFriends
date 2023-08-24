//
//  Users.swift
//  CloseFriends
//
//  Created by Batuhan Küçükyıldız on 24.08.2023.
//

import Foundation


//MARK: Uniq Id :Identifiable
struct Users : Decodable , Identifiable {
    var id : Int
    var name : String
    var username : String
    var email : String

}
