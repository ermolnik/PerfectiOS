//
//  RandomService.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//Copyright © 2019 Fun. All rights reserved.
//

import Moya
import SwiftyJSON

/** RandomService Class

*/
class RandomService: MoyaProvider<RandomAPI>{
    
        func getEvents(for pageNumber: Int, onSuccess: @escaping ([Event])->Void) {
            request(.getEvents(pageNumber)) { result in
                switch result {
                case .success(let response):
                    let json = JSON(response.data as Any)
                    guard let jsonEvents = json["list"].array else {
                        printError(with: " not data")
                        return
                    }
                    
                    let events = jsonEvents.compactMap { Event.parse(from: $0) }
                    onSuccess(events)
                    break
                case .failure(let error):
                    printError(with: "\(#function): \(error)")
                    break
                }
            }
            
        }
        
        func downloadImage(with imageUrl: String, onSuccess: @escaping (Data)->Void) {
            request(.downloadImage(imageUrl)) { result in
                switch result {
                case .success(let response):
                    onSuccess(response.data)
                    break
                case .failure(let error):
                    printError(with: "\(#function): \(error)")
                    break
                }
            }
        }
    
}
