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

/** RandomService Class

*/
class RandomService: MoyaProvider<RandomAPI>{
    
        func getGirls(onSuccess: @escaping ([String])->Void) {
            request(.getGirls(2)) { result in
                switch result {
                case .success(let response):
                    do {
                        if let mapJson = try response.mapJSON(failsOnEmptyData: true) as? [String: AnyObject] {
                            
                            let x = jsonItem(item: mapJson)["results"]
                            
                            if let arrItems = x as? Array<AnyObject> {
                                for item in arrItems {
                                   if let girlPictureUrl = jsonItem(item: item)["picture"]?["large"] as? String {
                                        print(girlPictureUrl)
                                    }
                                }
                            }
                            
                            
                            onSuccess([])
                        }
                    } catch (let error) {
                        printError(with: error.localizedDescription)
                    }
                    
                    break
                case .failure(let error):
                    printError(with: "\(#function): \(error)")
                    break
                }
            }
            
        }
    
    
}
