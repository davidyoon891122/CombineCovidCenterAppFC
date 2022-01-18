//
//  CenterDetailView.swift
//  FindCoronaCenter
//
//  Created by David Yoon on 2022/01/18.
//

import SwiftUI
import MapKit

struct CenterDetailView: View {
    var center: Center
    
    var body: some View {
        VStack {
            MapView(coordination: center.coordinate)
                .ignoresSafeArea(edges: .all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            CenterRow(center: center)
        }
        .navigationTitle(center.facilityName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CenterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let center = Center(id: 0, sido: .경기도, facilityName: "실내빙상장 앞", address: "경기도 머머시 머머구", lat: "37.404476", lng: "126.9491998", centerType: .central, phoneNumber: "000-0000-0000")
        CenterDetailView(center: center)
    }
}
