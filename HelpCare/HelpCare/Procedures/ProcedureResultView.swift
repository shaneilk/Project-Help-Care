//
//  ProcedureResultView.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-21.
//

import SwiftUI

// Procedure Name -> Total cases waiting; 50% of cases completed within; 90% of cases completed within
// Hospital Name -> same stats
// Specialist Name -> same stats

// Section by Hospital

// Fraser Health & Vancouver Coastal Health

struct ProcedureResultView: View {
    // Fraser Health
    var fraserHealth = HospitalRegion(regionName: "Fraser Health", hospitals: [ProcedureHospital(hospitalName: "Surrey Memorial Hospital", casesWaiting: 18, fiftyPercentile: 5.1, ninetyPercentile: 20.2, specialists: [Specialist(firstName: "Marin", lastName: "Aidelbaum", surgeonId: 132679, casesWaiting: 8), Specialist(firstName: "Donald Willis", lastName: "Anderson", surgeonId: 132218, casesWaiting: 5), Specialist(firstName: "Gerald", lastName: "Wittenberg", surgeonId: 132661, casesWaiting: 5, fiftyPercentile: 4.6, ninetyPercentile: 7.5)]),
       ProcedureHospital(hospitalName: "Burnaby Hospital", casesWaiting: 1, specialists: [Specialist(firstName: "Oleksandr", lastName: "Butskiy", surgeonId: 132382, casesWaiting: 1), Specialist(firstName: "Femida", lastName: "Kherani", surgeonId: 132523, casesWaiting: 1)])])
    
    
    // Vancouver Coastal Health
    var vancouverCoastalHealth = HospitalRegion(regionName: "Vancouver Coastal Health", hospitals: [ProcedureHospital(hospitalName: "Vancouver General Hospital", casesWaiting: 10, specialists: [Specialist(firstName: "Donald Willis", lastName: "Anderson", surgeonId: 132218, casesWaiting: 1), Specialist(firstName: "Douglas John", lastName: "Courtemanche", surgeonId: 132652, casesWaiting: 1), Specialist(firstName: "James Scott", lastName: "Durham", surgeonId: 133039, casesWaiting: 1)]),
        ProcedureHospital(hospitalName: "Lions Gate Hospital", casesWaiting: 13, fiftyPercentile: 3.0, ninetyPercentile: 35.7, specialists: [Specialist(firstName: "Torin", lastName: "Barr", surgeonId: 132810, casesWaiting: 8), Specialist(firstName: "George", lastName: "Chang", surgeonId: 132771, casesWaiting: 1), Specialist(firstName: "Ali", lastName: "Sadeghi", surgeonId: 133022, casesWaiting: 1)])])
    
    var generalCasesWaiting: Int = 401
    var generalFiftyPercentile: Double = 8.7
    var generalNinetyPercentile: Double = 41.1
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading){
                Section {
                    HStack {
                        Text("General Information")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding([.top, .leading, .trailing])
                        Spacer()
                    }
                    Text("as of October 31, 2023")
                        .padding([.leading, .bottom])
                        .foregroundColor(.secondary)
                    InformationLabel(inputNumber: "401", description: "Cases pending")
                    InformationLabel(inputNumber: "8.7 weeks", description: "50% procedures completed")
                    InformationLabel(inputNumber: "41.1 weeks", description: "90% procedures completed")
                }
                
                Section {
                    HStack {
                        Text("Vancouver Coastal Health")
                            .fontWeight(.semibold)
                            .font(.title2)
                            .padding([.leading, .top])
                            .padding(.bottom, 2)
                        Spacer()
                    }
                    InformationLabel(inputNumber: "98", description: "Cases pending")
                    InformationLabel(inputNumber: "15.4 weeks", description: "50% procedures completed")
                    InformationLabel(inputNumber: "51.2 weeks", description: "90% procedures completed")
                    
                    ForEach(vancouverCoastalHealth.hospitals) { hospital in
                        Text(hospital.hospitalName)
                            .padding(.leading)
                            .padding(.top)
                            .fontWeight(.semibold)
                        ForEach(hospital.specialists) { specialist in
                            FilterButton(specialist: specialist.firstName + " " + specialist.lastName, casesWaiting: specialist.casesWaiting < 5 ? "< 5" : String(specialist.casesWaiting), fiftyPercentile: String(specialist.fiftyPercentile ?? 0), ninetyPercentile: String(specialist.ninetyPercentile ?? 0))
                                .padding()
                        }
                    }
                }
                
                Section {
                    HStack {
                        Text("Fraser Health")
                            .fontWeight(.semibold)
                            .font(.title2)
                            .padding([.leading, .top])
                            .padding(.bottom, 2)
                        Spacer()
                    }
                    InformationLabel(inputNumber: "60", description: "Cases pending")
                    InformationLabel(inputNumber: "7.1 weeks", description: "50% procedures completed")
                    InformationLabel(inputNumber: "20.3 weeks", description: "90% procedures completed")
                    
                    ForEach(fraserHealth.hospitals) { hospital in
                        Text(hospital.hospitalName)
                            .padding(.leading)
                            .padding(.top)
                            .fontWeight(.semibold)
                        ForEach(hospital.specialists) { specialist in
                            FilterButton(specialist: specialist.firstName + " " + specialist.lastName, casesWaiting: specialist.casesWaiting < 5 ? "< 5" : String(specialist.casesWaiting), fiftyPercentile: String(specialist.fiftyPercentile ?? 0), ninetyPercentile: String(specialist.ninetyPercentile ?? 0))
                                .padding()
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct ProcedureResultView_Previews: PreviewProvider {
    static var previews: some View {
        ProcedureResultView()
    }
}
