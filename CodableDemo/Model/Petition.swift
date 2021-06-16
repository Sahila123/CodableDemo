//
//  Petition.swift
//  CodableDemo
//
//  Created by Mirajkar on 16/06/21.
//  Copyright © 2021 Mirajkar. All rights reserved.
//

import Foundation


struct Petition : Decodable { //Codable = Encodable + Decodable
    var id : String
    var title : String
    var body : String
    var signatureCount : Int
    var issues : [issues]
}


struct  issues : Decodable {
    var id : Int
    var name : String
}
