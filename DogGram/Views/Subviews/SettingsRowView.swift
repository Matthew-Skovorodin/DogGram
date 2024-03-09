//
//  SettingsRowView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/12/24.
//

import SwiftUI

struct SettingsRowView: View {
    
    var leftIcon: String
    var text: String
    var color: Color
    
    var body: some View {
        HStack {
            
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: leftIcon)
                    .font(.title3)
                    .foregroundStyle(.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text)
                .foregroundStyle(.primary)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundStyle(.primary)
            
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    SettingsRowView(leftIcon: "heart.fill", text: "Row title", color: .red)
        .previewLayout(.sizeThatFits)
}
