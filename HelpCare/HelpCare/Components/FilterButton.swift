//
//  FilterButton.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-20.
//

import SwiftUI

struct FilterButton: View {
    @State var specialist: String
    
    @State var casesWaiting: String
    @State var fiftyPercentile: String?
    @State var ninetyPercentile: String?
    
    
    var body: some View {
        VStack(alignment: .leading){
            Section{
                HStack {
                    Text(specialist)
                        .fontWeight(.semibold)
                        .padding(.leading)
                        .padding(.bottom, 2)
                        .font(.headline)
                    Spacer()
                    Text(casesWaiting)
                        .fontWeight(.semibold)
                    Text("cases pending")
                        .fontWeight(.semibold)
                        .padding(.trailing)
                }
                .padding(.top, 2)
            }
            
            Section{
                HStack {
                    if(fiftyPercentile == "0.0"){
                        Text("N/A")
                            .padding(.leading)
                            .fontWeight(.semibold)
                    }
                    else {
                        Text(fiftyPercentile! + " " + "weeks")
                            .padding(.leading)
                            .fontWeight(.semibold)
                    }
                    Text("50% procedures completed")
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            
            Section{
                HStack {
                    if(ninetyPercentile == "0.0"){
                        Text("N/A")
                            .padding(.leading)
                            .fontWeight(.semibold)
                    }
                    else {
                        Text(ninetyPercentile! + " " + "weeks")
                            .padding(.leading)
                            .fontWeight(.semibold)
                    }
                    Text("90% procedures completed")
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
        }
        .frame(height: UIScreen.main.bounds.width / 3.5)
        .frame(maxWidth: UIScreen.main.bounds.width / 1.1)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: Color(.systemGray), radius: 3, x:1, y:2)
        )
    }
}
struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton(specialist: "Richard Bell", casesWaiting: "6", fiftyPercentile: "5.3", ninetyPercentile: "12.4")
    }
}
