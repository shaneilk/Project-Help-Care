//
//  Hospital.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-20.
//

import Foundation

struct Hospital: Identifiable {
    var name: String
    var address: String
    var status: Bool
    var latitude: Double?
    var longitude: Double?
    
    var id = UUID()
}
