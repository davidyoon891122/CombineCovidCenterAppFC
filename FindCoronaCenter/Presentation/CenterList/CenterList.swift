//
//  CenterList.swift
//  FindCoronaCenter
//
//  Created by David Yoon on 2022/01/18.
//

import SwiftUI

struct CenterList: View {
    var centers = [Center]()
    
    var body: some View {
        List(centers, id: \.id) { center in
            NavigationLink(
                destination: CenterDetailView(center: center)) {
                CenterRow(center: center)
            }
            .navigationTitle(center.sido.rawValue)
        }
    }
}

struct CenterList_Previews: PreviewProvider {
    static var previews: some View {
        let centers = [
            Center(id: 0, sido: .경기도, facilityName: "실내빙상장 앞", address: "경기도 머머시 머머구", lat: "37.404476", lng: "126.9491998", centerType: .central, phoneNumber: "000-0000-0000"),
            Center(id: 1, sido: .경상북도, facilityName: "실내빙상장 앞", address: "경기도 머머시 머머구", lat: "37.404476", lng: "126.9491998", centerType: .central, phoneNumber: "000-0000-0000")
        ]
        CenterList(centers: centers)
    }
}
