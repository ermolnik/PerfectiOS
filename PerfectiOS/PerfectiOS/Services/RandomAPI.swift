//
//  RandomAPI.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import Moya


enum RandomAPI {
    case getEvents(Int)
    case downloadImage(String)
}

extension RandomAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .downloadImage(let urlString):
            return URL(fileURLWithPath: urlString)
        default:
            return URL(string: ServerUrls.Dev.EVENTS )!
        }
    }
    
    var path: String {
        switch self {
        case .getEvents(_):
            return "/api/v1/events"
        case .downloadImage(let urlString):
            return urlString
        }
        
    }
    var method: Moya.Method {
        switch self {
        case .getEvents(_):
            return .get
        case .downloadImage(_):
            return .get
        }
    }
    var task: Task {
        switch self {
        case .getEvents(let pageNumber):
            return .requestParameters(parameters: ["page": pageNumber,
                                                   "sort": "-created_at"], encoding: URLEncoding.default)
        case .downloadImage(_):
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        switch self {
        case .getEvents(_):
            return [
                "Content-type": "application/json",
                "Accept": "application/json"
            ]
        case .downloadImage(_):
            return [
                "Content-type": "image/jpeg",
                ]
        }
    }
}
