//
//  ProcedureView.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-20.
//

import SwiftUI

struct ProcedureView: View {
    @State var isAdult = false
    @State var isChild = false
    
    @State var ageGroup = "Select.."
    @State private var editAgeGroup = false
    
    @State var selectedBodyArea = "Head & Neck"
    @State private var editBodyArea = false
    
    @State var selectedHeadArea = "Select.."
    @State private var editSurgeryArea = false
    
    let bodyAreas = ["Head & Neck", "Chest & Breast", "Arms, Shoulders & Hands", "Abdomen, Pelvic area, & Groin", "Leg, Hip, Knee & Foot"]
    
    let headAreas = ["Cranial Surgery", "Facial Bone Reconstruction", "Parotidectomy", "Sinus Surgery"]
    
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading) {
                    Text("Age Group")
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    HStack {
                        Text(ageGroup)
                            .fontWeight(.bold)
                            .font(.title3)
                        Spacer()
                        Image(systemName: "pencil")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                            .padding(.bottom)
                            .onTapGesture {
                                editAgeGroup.toggle()
                            }
                    }
                    if(editAgeGroup){
                        Picker("", selection: $ageGroup){
                            Text("Adult (17+)")
                                .tag("Adult (17+)")
                            Text("Pediatric (under 17)")
                                .tag("Pediatric (under 17)")
                        }
                        .pickerStyle(.segmented)
                    }
                }
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("Body Area")
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    HStack {
                        Text(selectedBodyArea)
                            .fontWeight(.bold)
                            .font(.title3)
                        Spacer()
                        Image(systemName: "pencil")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                            .padding(.bottom)
                            .onTapGesture {
                                editBodyArea.toggle()
                            }
                    }
                    if(editBodyArea){
                        Picker("", selection: $selectedBodyArea){
                            ForEach(bodyAreas, id:\.self){
                                Text($0)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                }
            }
            
            if(selectedBodyArea == "Head & Neck"){
                Section {
                    VStack(alignment: .leading) {
                        Text("Type of Surgery")
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        HStack {
                            Text(selectedHeadArea)
                                .fontWeight(.bold)
                                .font(.title3)
                            Spacer()
                            Image(systemName: "pencil")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                                .padding(.bottom)
                                .onTapGesture {
                                    editSurgeryArea.toggle()
                                }
                        }
                        if(editSurgeryArea){
                            Picker("", selection: $selectedHeadArea){
                                ForEach(headAreas, id:\.self){
                                    Text($0)
                                }
                            }
                            .pickerStyle(.wheel)
                        }
                    }
                }                
            }
            
            if(ageGroup != "Select.." && selectedBodyArea == "Head & Neck" && selectedHeadArea == "Facial Bone Reconstruction"){
                Section {
                    NavigationLink {
                        ProcedureResultView()
                    } label: {
                        Text("Search")
                            .foregroundColor(Color(.systemBlue))
                    }
                }
            }
        }
    }
}

struct ProcedureView_Previews: PreviewProvider {
    static var previews: some View {
        ProcedureView()
    }
}
