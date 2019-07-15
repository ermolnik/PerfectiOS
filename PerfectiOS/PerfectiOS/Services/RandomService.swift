//
//  RandomService.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//Copyright © 2019 Fun. All rights reserved.
//

import Moya

func jsonItem(item: Any) -> [String: AnyObject] {
    if let json = item as? [String: AnyObject] {
        return json
    }
    
    return [:]
}

enum RandomServiceError: Error {
    case common
    case failed
}

/** RandomService Class

*/
class RandomService: MoyaProvider<RandomAPI>{
    
    func getGirls(onError: @escaping (RandomServiceError)->Void = { _ in }, onSuccess: @escaping ([Person])->Void) {
            request(.getGirls(8)) { result in
                switch result {
                case .success(let response):
                    if let personsResponse = try? JSONDecoder()
                            .decode(PersonsResponse.self,
                                    from: response.data) {
                            onSuccess(personsResponse.results)
                    } else {
                        onError(.common)
                        printError(with: "get girls error parsing")
                    }
                    
                    break
                case .failure(let error):
                    onError(.failed)
                    printError(with: "\(#function): \(error)")
                    break
                }
            }
            
        }
    
    
}
