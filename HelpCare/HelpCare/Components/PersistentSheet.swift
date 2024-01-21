//
//  PersistentSheet.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-20.
//

import SwiftUI

struct PersistentSheet: View {
    var sampleData: [Hospital]
    
    @Binding var selectedHospital: Hospital?
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Good Afternoon")
                        .padding([.leading, .trailing, .bottom])
                        .padding(.top, 32)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                
                HStack {
                    NavigationLink {
                        ProcedureView()
                            .navigationTitle("Testing")
                    } label: {
                        SheetButton(icon: "list.clipboard.fill", description: "Search by Procedure")
                            .padding()
                            .padding(.leading, 8)
                    }
                    
                    NavigationLink {
                        SpecialistSearchView()
                            .navigationTitle("Search by Specialist")
                    } label: {
                        SheetButton(icon: "person.text.rectangle.fill", description: "Search by Specialist")
                            .padding()
                            .padding(.trailing, 8)
                    }
                }
                
                ForEach(sampleData) { hospital in
                    HospitalCell(hospitalName: hospital.name, status: hospital.status, address: hospital.address, waitTime: hospital.waitTime, lengthOfStay: hospital.lengthOfStay)
                        .onTapGesture {
                            selectedHospital = hospital
                        }
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
        PersistentSheet(sampleData: [Hospital(name: "Surrey Memorial Hospital", address: "13750 96 Ave, Surrey, BC V3V 1Z2", status: true, latitude: 49.176390, longitude: -122.842517, waitTime: "4:41", lengthOfStay: "5:18"),
                                     Hospital(name: "Vancouver General Hospital", address: "Jim Pattison Pavilion, 899 W 12th Ave, Vancouver, BC V5Z 1M9", status: false, latitude: 49.261400, longitude: -123.124731, waitTime: "3:13", lengthOfStay: "5:59"),
                                     Hospital(name: "St. Paul's Hospital", address: "1081 Burrard St, Vancouver, BC V6Z 1Y6", status: false, latitude: 49.280632, longitude: -123.130583, waitTime: "1:41", lengthOfStay: "4:30"),
                                     Hospital(name: "Peace Arch Hospital", address: "15521 Russell Ave, White Rock, BC V4B 5M2", status: true, latitude: 49.030095, longitude: -122.794846, waitTime: "5:25", lengthOfStay: "5:19"),
                                     Hospital(name: "Richmond Hospital", address: "7000 Westminster Hwy, Richmond, BC V6X 1A2", status: true, latitude: 49.168837, longitude: -123.149403, waitTime: "2:03", lengthOfStay: "4:56"),
                                     Hospital(name: "Langley Memorial Hospital", address: "22051 Fraser Hwy, Langley Twp, BC V3A 4H4", status: false, latitude: 49.095417, longitude: -122.615070, waitTime: "2:40", lengthOfStay: "4:27")], selectedHospital: .constant(Hospital(name: "Surrey Memorial Hospital", address: "13750 96 Ave, Surrey, BC V3V 1Z2", status: true, latitude: 49.176390, longitude: -122.842517, waitTime: "4:41", lengthOfStay: "5:18")))
    }
}
