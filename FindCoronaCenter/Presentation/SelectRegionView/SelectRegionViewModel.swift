//
//  SelectRegionViewModel.swift
//  FindCoronaCenter
//
//  Created by David Yoon on 2022/01/18.
//

import Foundation
import Combine
//ObservableObject is permitting observing this class from outside of class
//This class is provided by Combine
class SelectRegionViewModel: ObservableObject {
    @Published var centers = [Center.Sido: [Center]]() // object to publish
    private var cancellables = Set<AnyCancellable>()
    
    init(centerNetwork: CenterNetwork = CenterNetwork()) {
        centerNetwork.getCenterList()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: {[weak self] in
                    guard case .failure(let error) = $0 else { return }
                    print(error.localizedDescription)
                    self?.centers = [Center.Sido: [Center]]()
                },
                receiveValue: {[weak self] centers in
                    self?.centers = Dictionary(grouping: centers) { $0.sido }
                }
            )
            .store(in: &cancellables) //dispoase(by: disposeBag)
    }
}
