//
//  SFButtons.swift
//  MVVM Framework
//
//  Created by Miguel Angel Bohorquez on 23/09/25.
//

import SwiftUI

struct SFButtons: View {
    var title: String
    
    var body: some View {
        Text(title)
            .frame(width: 200, height: 40)
            .background(Color.red)
            .foregroundStyle(.white)
            .font(.title2)
            .fontWeight(.bold)
            .cornerRadius(10)
    }
}

#Preview {
    SFButtons(title: "Test")
}
