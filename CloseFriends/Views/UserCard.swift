//
//  User.swift
//  CloseFriends
//
//  Created by Batuhan Küçükyıldız on 24.08.2023.
//

import SwiftUI

struct UserCard: View {
    let user : Users
    init(user:Users ){
        self.user = user
    }
    var body: some View {
        VStack{
            ZStack{
                Image("header").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 120)
                    .clipped()
                
                Image("Photo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 120 , height: 120)
                    .clipped()
                    .offset(y: 40)
                    .frame(maxWidth: .infinity , alignment : .leading)
                    .padding(.horizontal)
                
            }.overlay(alignment : .topTrailing){
                Button{
                
                }label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .padding(6)
                        .frame(width: 60 , height: 60)
                        
                    
                }
            }
            VStack{
                Button {
                    
                } label: {
                    Text("Takip Et")
                        .foregroundColor(.white)
                        .padding(.vertical , 4)
                        .padding(.horizontal)
                        .overlay{
                            Capsule()
                                .stroke(lineWidth: 2)
                                .foregroundColor(.white)
                        }
                }
                .frame(maxWidth: .infinity , alignment: .trailing)
                .padding()
                HStack{
                    Text(user.name)
                        .fontWeight(.bold)
                        .padding(.bottom ,20)
                    
                    Text(user.username)
                        .foregroundColor(.secondary)
                        .padding(.bottom ,20)
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                .padding(.leading)
                

            }
        }
        .background(Color(.gray))
        .cornerRadius(20)
    }
}
/*
struct User_Previews: PreviewProvider {
    static var previews: some View {
        User(user: UsersViewModel())
    }
}
*/
