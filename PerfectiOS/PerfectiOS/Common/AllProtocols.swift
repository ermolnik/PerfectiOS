//
//  AllProtocols.swift
//  PerfectiOS
//
//  Created by Кирилл Худяков on 16/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

enum DataManagerInputError: Error {
    case common
    case loadingError
}

protocol PersonDataManagerInputDelegate {
    func getPersonList(onError: @escaping (DataManagerInputError)->Void, onSuccess: @escaping ([Person])->Void)
    func save(item: Person) throws
}


