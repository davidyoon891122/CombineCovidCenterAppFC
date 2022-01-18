//
//  MapView.swift
//  FindCoronaCenter
//
//  Created by David Yoon on 2022/01/18.
//

import SwiftUI
import MapKit

struct AnnotationItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}


struct MapView: View {
    var coordination: CLLocationCoordinate2D
    // State is not take any effect from outside, just only use in this view
    @State private var region = MKCoordinateRegion()
    @State private var annotaionitems = [AnnotationItem]()
    var body: some View {
        Map(
            coordinateRegion: $region,
            annotationItems: [AnnotationItem(coordinate: coordination)],
            annotationContent: {
                MapMarker(coordinate: $0.coordinate)
            }
        )
        .onAppear{
            setRegion(coordination)
            setAnnotationItems(coordination)
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01,
                                   longitudeDelta: 0.01))
    }
    private func setAnnotationItems(_ coordinate: CLLocationCoordinate2D) {
        annotaionitems = [AnnotationItem(coordinate: coordinate)]
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let center = Center(id: 0, sido: .경기도, facilityName: "실내빙상장 앞", address: "경기도 머머시 머머구", lat: "37.404476", lng: "126.9491998", centerType: .central, phoneNumber: "000-0000-0000")
        MapView(coordination: CLLocationCoordinate2D(latitude: CLLocationDegrees(center.lat) ?? .zero, longitude: CLLocationDegrees(center.lng) ?? . zero))
    }
}
