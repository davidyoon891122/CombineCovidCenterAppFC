//
//  CenterAPIResponse.swift
//  FindCoronaCenter
//
//  Created by David Yoon on 2022/01/18.
//

import Foundation


struct CenterAPIResponse: Decodable {
    let data: [Center]
}
