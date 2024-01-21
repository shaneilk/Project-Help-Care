//
//  IconText.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-20.
//

import SwiftUI

struct IconText: View {
    @State var displayText: String
    @State var status: Bool
    
    var body: some View {
        HStack{
            Image(systemName: status ? "checkmark.circle.fill" : "xmark.circle.fill")
                .font(.title3)
                .foregroundColor(status ? .green : .red)
                .padding(.leading)
            Text(displayText)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}

struct IconText_Previews: PreviewProvider {
    static var previews: some View {
        IconText(displayText: "hs2", status: true)
    }
}
