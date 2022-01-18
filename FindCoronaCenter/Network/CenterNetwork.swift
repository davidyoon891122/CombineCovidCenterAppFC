//
//  CenterNetwork.swift
//  FindCoronaCenter
//
//  Created by David Yoon on 2022/01/18.
//

import Foundation
import Combine


class CenterNetwork {
    private let session: URLSession
    let api = CenterAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getCenterList() -> AnyPublisher<[Center], URLError> {
        guard let url = api.getCenterListComponents().url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.setValue("Infuser HLpc7NmQRsK5MRxtyaIKNkmkLW7z1yUUCBObEqMr0GdwwTWoIjTMfZkDmKsu0QQThWRrhzsRLT4KyVItTTKM/Q==", forHTTPHeaderField: "Authorization")
        
        return session.dataTaskPublisher(for: request)
            .tryMap{ data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.unknown)
                }
                
                switch httpResponse.statusCode {
                case 200..<300:
                    return data
                case 400..<500:
                    throw URLError(.clientCertificateRejected)
                case 500..<599:
                    throw URLError(.badServerResponse)
                default:
                    throw URLError(.unknown)
                }
            }
            .decode(type: CenterAPIResponse.self, decoder: JSONDecoder())
            .map { $0.data }
            .mapError { $0 as! URLError }
            .eraseToAnyPublisher()
    }
}

