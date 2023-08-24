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
                Image("header")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 80)  // Resim yüksekliğini düşür
                    .clipped()
                
                Image("Photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)  // Resmi ve çerçeveyi küçült
                    .clipped()
                    .offset(y: 20)  // Resmi biraz daha yukarı kaydır
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            .overlay(alignment: .topTrailing){
                Button{
                    // Buton işlevi
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .padding(6)
                        .frame(width: 40, height: 40)  // Buton boyutunu düşür
                }
            }
            VStack{
                Button {
                    // Buton işlevi
                } label: {
                    Text("Takip Et")
                        .foregroundColor(.white)
                        .padding(.vertical, 2)  // Buton iç boşluğunu düşür
                        .padding(.horizontal)
                        .overlay{
                            Capsule()
                                .stroke(lineWidth: 2)
                                .foregroundColor(.white)
                        }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                HStack{
                    Text(user.name)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    Text(user.username)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            }
        }
        .background(Color(.gray))
        .cornerRadius(15)  // Kart köşelerinin yuvarlatılmasını artır
        .padding()  // Kartın dış boşluğunu azalt
    }

}
/*
struct User_Previews: PreviewProvider {
    static var previews: some View {
        User(user: UsersViewModel())
    }
}
*/
