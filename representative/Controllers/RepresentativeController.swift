//
//  RepresentativeController.swift
//  representative
//
//  Created by RYAN GREENBURG on 2/7/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseUrl = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void) {
        guard var url = baseUrl else { completion([]); return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let searchTermQuery = URLQueryItem(name: "state", value: state)
        let jsonQueryItem = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [searchTermQuery, jsonQueryItem]
        
        guard let componentsUrl = components?.url else { completion([]); return }
        let request = URLRequest(url: componentsUrl)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let downloadError = error {
                print("Error downloading info from source: \(downloadError.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else { completion([]); return }
            
            let dataAsString = String(data: data, encoding: .ascii)
            guard let dataAsData = dataAsString?.data(using: .utf8) else { completion([]); return }
            
            
            do {
                let decoder = JSONDecoder()
                let repsDictionary = try decoder.decode(TopLevelJSON.self, from: dataAsData)
                let reps = repsDictionary.results
                
                completion(reps)
                
            } catch {
                print("Error decoding representatives for \(state) \(error.localizedDescription)")
                completion([])
            }
        }
        dataTask.resume()
    }
}
