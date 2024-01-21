//
//  InformationLabel.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-21.
//

import SwiftUI

struct InformationLabel: View {
    @State var inputNumber: String
    @State var description: String
    
    var body: some View {
        HStack {
            Text(inputNumber)
                .padding(.leading)
                .fontWeight(.medium)
                .font(.headline)
            Text(description)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
            Spacer()
        }
        Divider()
    }
}

struct InformationLabel_Previews: PreviewProvider {
    static var previews: some View {
        InformationLabel(inputNumber: "401", description: "Cases pending")
    }
}
