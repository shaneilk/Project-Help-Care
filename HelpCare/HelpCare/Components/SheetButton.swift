//
//  SheetButton.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-20.
//

import SwiftUI

// person.text.rectangle.fill

struct SheetButton: View {
    @State var icon: String
    @State var description: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(Color(.systemGray))
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
        )
    }
}

struct SheetButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.systemGray2)
                .ignoresSafeArea()
            SheetButton(icon: "person.text.rectangle.fill", description: "testing")
        }
    }
}
