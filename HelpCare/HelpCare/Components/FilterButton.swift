//
//  FilterButton.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-20.
//

import SwiftUI

struct FilterButton: View {
    @State var icon: String
    @State var description: String
    @Binding var selected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(Color(.systemBlue).opacity(0.80))
            Text(description)
                .fontWeight(.medium)
                .font(.callout)
                .padding(.top, 4)
                .padding([.leading, .trailing])
        }
        .frame(height: UIScreen.main.bounds.height / 6)
        .frame(maxWidth: UIScreen.main.bounds.width / 2.5)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 4)
                )
        )
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton(icon: "circle", description: "testing", selected: .constant(true))
    }
}
