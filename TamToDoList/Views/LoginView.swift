//
//  LoginView.swift
//  TamToDoList
//
//  Created by Abhinav Vinod  on 1/29/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //header
                HeaderView(title: "Tam's To Do List", subtitle: "Time to Cook!", angle1: -130, angle2: -45, angle3: 20, angle4: -15, bg1: Color.blue, bg2: Color.mint, bg3: Color.indigo, bg4: Color.pink)
                
                
                //login fields
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    TLButton(title: "Log In", bg: Color.blue) {
                        viewModel.login()
                    }
                    .padding()
                }
                .frame(width: 300, height: 230)
                .border(Color.purple, width: 2)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                
                //create account jazz
                
                
                VStack {
                    Text("First Time Here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.top, 100)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
