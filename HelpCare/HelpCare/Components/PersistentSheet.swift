//
//  PersistentSheet.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-20.
//

import SwiftUI

struct PersistentSheet: View {
    var sampleData = [Hospital(name: "Surrey Memorial Hospital", address: "13750 96 Ave, Surrey, BC V3V 1Z2", status: true),
                      Hospital(name: "hs2", address: "sample address", status: true),
                      Hospital(name: "hs3", address: "sample address", status: true),
                      Hospital(name: "hs4", address: "sample address", status: true),
                      Hospital(name: "hs5", address: "sample address", status: true)]
    
    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    Text("Welcome")
                        .padding([.leading, .trailing, .bottom])
                        .padding(.top, 32)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                
                ForEach(sampleData) { hospital in
                    HospitalCell(hospitalName: hospital.name, status: hospital.status, address: hospital.address)
                        .padding([.leading, .trailing, .bottom])
                }
            }
        }
        .frame(height: UIScreen.main.bounds.height / 2.5)
        .frame(maxWidth: UIScreen.main.bounds.width)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(.systemGray2).opacity(0.60))
        )
    }
}

struct PersistentSheet_Previews: PreviewProvider {
    static var previews: some View {
        PersistentSheet()
    }
}
