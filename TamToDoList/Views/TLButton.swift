//
//  TLButton.swift
//  TamToDoList
//
//  Created by Abhinav Vinod  on 1/30/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let bg: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label:    {
            ZStack {
                RoundedRectangle(cornerRadius: 40)
                    .foregroundColor(bg)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Title", bg: Color.blue) {
        //Action
    }
}
