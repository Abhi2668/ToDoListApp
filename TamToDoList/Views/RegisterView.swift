//
//  RegisterView.swift
//  TamToDoList
//
//  Created by Abhinav Vinod  on 1/29/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            //header
            HeaderView(title: "Register Now!", subtitle: "One Account, All Your Progress.", angle1: -130, angle2: -45, angle3: 20, angle4: -15, bg1: Color.orange, bg2: Color.yellow, bg3: Color.red, bg4: Color(red: 1, green: 0.361, blue: 0))
        }
        
        Form {
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundStyle(Color.red)
            }
            
            TextField("Full Name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
            
            TLButton(title: "Create Account", bg: Color.blue) {
                viewModel.register()
            }
            .padding()
        }
        .frame(width: 300, height: 270)
        .border(Color.blue, width: 2)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        Spacer()
    }
}

#Preview {
    RegisterView()
}
