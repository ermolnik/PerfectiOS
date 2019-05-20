//
//  Person.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import Foundation
import UIKit


class Person {
    var name: String?
    var photo: Data?
    var pictureUrl: String?
}

extension Person: CustomStringConvertible {
    var description: String {
        return "\nPerson: \(name ?? "none") \(pictureUrl ?? "none")"
    }
}

extension Person {
    func from(item: [String: AnyObject]) {
        print(item)
        if
            let firstName = item["name"]?["first"] as? String,
            let lastName = item["name"]?["last"] as? String
        {
            self.name = "\(firstName) \(lastName)"
        }
        
        if let girlPictureUrl = item["picture"]?["large"] as? String {
            self.pictureUrl = girlPictureUrl
        }
        
        var imgView = UIImageView()
        imgView.kf.setImage(with: )
    }
}
