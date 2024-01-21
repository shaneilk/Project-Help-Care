//
//  HospitalRegion.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-21.
//

import Foundation

struct HospitalRegion: Identifiable {
    var regionName: String
    var hospitals: [ProcedureHospital]
    
    var id = UUID()
}

struct ProcedureHospital: Identifiable {
    var hospitalName: String
    var casesWaiting: Int
    var fiftyPercentile: Double?
    var ninetyPercentile: Double?
    
    var specialists: [Specialist]
    
    
    var id = UUID()
}

struct Specialist: Identifiable {
    var firstName: String
    var lastName: String
    var surgeonId: Int
    
    var casesWaiting: Int
    var fiftyPercentile: Double?
    var ninetyPercentile: Double?
    
    var id: Int {
        surgeonId
    }
}
