//
//  Person.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import Foundation
import UIKit


struct Person: Decodable {
    
    let name: Name?
    let gender: String?
    let email: String?
    let phone: String?
    let cell: String?
    
    let photo: Data?
    let picture: Picture?
    
}

extension Person {
    var fullName: String? {
        
        guard
            let first = name?.first,
            let last = name?.last
            else {
                return nil
        }
        
        return "\(first) \(last)"
    }
    
    var pictureLink: String? {
        if let link = picture?.large {
            return link
        }
        
        return nil
    }
    
    var pictureUrl: URL? {
        return URL(string: pictureLink ?? "")
    }
}

extension Person {
    struct Name: Decodable {
        let title: String?
        let first: String?
        let last: String?
    }
    
    struct Picture: Decodable {
        let large: String?
        let medium: String?
        let thumbnail: String?
    }
}

struct PersonsResponse: Decodable {
    let results: [Person]
    let info: Info?
}

extension PersonsResponse {
    struct Info: Decodable {
        let seed: String?
        let results: Int?
        let page: Int?
        let version: String?
    }
}
