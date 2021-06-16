//
//  NetworkManager.swift
//  CodableDemo
//
//  Created by Mirajkar on 16/06/21.
//  Copyright © 2021 Mirajkar. All rights reserved.
//

import Foundation


class NetworkManager {
    
    //MARK: Global Variables
    
    static let shared = NetworkManager()
    private init() { }

    var petitions : [Petition] = []
    var defaultSession = URLSession(configuration: .default)
    var dataTask : URLSessionDataTask?
    var errorMessage = ""

    //MARK: API Call

    func callPetitionAPI()  {
        dataTask?.cancel()
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/petitions-1.json") else { return }
        
        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data  = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                self.parse(json: data)
            }
        })
        dataTask?.resume()
    }
    
    //MARK: Parse Response

    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            self.petitions = jsonPetitions.results
            
            for petition in self.petitions {
                print("title: \(petition.title)\n signatureCount:\(petition.signatureCount)")
                for issue in petition.issues {
                    print("issue : \(issue)")
                }
            }
        }
    }
    
    
}
