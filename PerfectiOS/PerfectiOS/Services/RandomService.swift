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
                    do {
                        if let mapJson = try response.mapJSON(failsOnEmptyData: true) as? [String: AnyObject] {
                            var persons: [Person] = []
                            let results = jsonItem(item: mapJson)["results"]
                            if let arrItems = results as? Array<AnyObject> {
                                for item in arrItems {
                                    let person = Person()
                                    person.from(item: jsonItem(item: item))
                                    persons.append(person)
                                }
                            }
                            
                            onSuccess(persons)
                        }
                    } catch (let error) {
                        onError(.common)
                        printError(with: error.localizedDescription)
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
