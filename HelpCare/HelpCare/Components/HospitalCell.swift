//
//  HospitalCell.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-20.
//

import SwiftUI

struct HospitalCell: View {
    @State var hospitalName: String
    @State var status: Bool
    @State var address: String
    @State var waitTime: String
    @State var lengthOfStay: String
    
    
    var body: some View {
        VStack(alignment: .leading){
            IconText(displayText: hospitalName, status: status)
            Text(address)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(.secondary)
                .padding(.leading, 18)
                .padding(.trailing)
                .padding(.bottom, 2)
            HStack {
                Image(systemName: "clock.fill")
                    .font(.title3)
                    .foregroundColor(.yellow)
                    .padding(.leading)
                Text(waitTime)
                    .fontWeight(.medium)
                Image(systemName: "hourglass.bottomhalf.filled")
                    .font(.title3)
                    .foregroundColor(.yellow)
                    .padding(.leading)
                Text(lengthOfStay)
                    .fontWeight(.medium)
                Spacer()
            }
        }
        .frame(height: UIScreen.main.bounds.width / 3.5)
        .frame(maxWidth: UIScreen.main.bounds.width / 1.1)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
        )
    }
}

struct HospitalCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.systemGray2)
                .ignoresSafeArea()
            HospitalCell(hospitalName: "hs2", status: true, address: "sample address", waitTime: "3:07", lengthOfStay: "5:35")
        }
    }
}
