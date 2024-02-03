//
//  HeaderView.swift
//  TamToDoList
//
//  Created by Abhinav Vinod  on 1/29/24.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle1: Double
    let angle2: Double
    let angle3: Double
    let angle4: Double
    let bg1: Color
    let bg2: Color
    let bg3: Color
    let bg4: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bg1)
                .rotationEffect(Angle(degrees: angle1))
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bg2)
                .rotationEffect(Angle(degrees: angle2))
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bg3)
                .rotationEffect(Angle(degrees: angle3))
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bg4)
                .rotationEffect(Angle(degrees: angle4))
            
            
            VStack {
                Text(title)
                    .font(.system(size: 45))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
                
                
            }
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle1: -130, angle2: -45, angle3: 20, angle4: -15, bg1: Color.blue, bg2: Color.mint, bg3: Color.indigo, bg4: Color.pink)
}
