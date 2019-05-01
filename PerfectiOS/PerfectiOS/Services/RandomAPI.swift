//
//  RandomAPI.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import Moya


enum RandomAPI {
    case getUsers
    case getGirls(Int)
}

extension RandomAPI: TargetType {
    var baseURL: URL {
        switch self {
        default:
            return URL(string: Constants.API.host )!
        }
    }
    
    var path: String {
        switch self {
        case .getGirls:
            fallthrough
        case .getUsers:
            return "/api"
        }
        
    }
    var method: Moya.Method {
        switch self {
        case .getGirls:
            return .get
        case .getUsers:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .getGirls(let count):
            return .requestParameters(parameters: [
                "results": count,
                "gender":"female"
                ], encoding: URLEncoding.default)
        case .getUsers:
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        switch self {
        case .getGirls:
            fallthrough
        case .getUsers:
            return [
                "Content-type": "application/json",
                "Accept": "application/json"
            ]
        }
    }
}
