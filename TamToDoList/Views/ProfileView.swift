//
//  ProfileView.swift
//  TamToDoList
//
//  Created by Abhinav Vinod  on 1/29/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    init() {
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.text.rectangle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 125.0, height: 125.0)
            .foregroundStyle(Color(hue: 0.538, saturation: 0.549, brightness: 0.97, opacity: 0.777))
            .padding()
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .foregroundColor(Color(hue: 0.696, saturation: 0.995, brightness: 0.482))
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .foregroundColor(Color(hue: 0.696, saturation: 0.995, brightness: 0.482))
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member Since: ")
                    .foregroundColor(Color(hue: 0.696, saturation: 0.995, brightness: 0.482))
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        Button {
            viewModel.logOut()
        } label:    {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color.red)
                
                Text("Sign Out")
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .frame(width: 100.0, height: 50.0)
        .tint(.red)
        .padding()
        
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
