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


//extension Person: CustomStringConvertible {
//    var description: String {
//        return "\nPerson: \(name ?? "none") \(pictureUrl ?? "none")"
//    }
//}

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


//extension Person {
//    func from(item: [String: AnyObject]) {
//        print(item)
//        if
//            let firstName = item["name"]?["first"] as? String,
//            let lastName = item["name"]?["last"] as? String
//        {
//            self.name = "\(firstName) \(lastName)"
//        }
//
//        if let girlPictureUrl = item["picture"]?["large"] as? String {
//            self.pictureUrl = girlPictureUrl
//        }
//
//        var imgView = UIImageView()
////        imgView.kf.setImage(with: <#T##Source?#>)
//    }
//}

struct PersonsResponse: Decodable {
    let results: [Person]
}


