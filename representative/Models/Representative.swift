//
//  Representative.swift
//  representative
//
//  Created by RYAN GREENBURG on 2/7/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct TopLevelJSON: Codable {
    let results: [Representative]
}

struct Representative: Codable {
    let name: String
    let party: String
    let state: String
    let district: String
    let link: String
    let phone: String
}
