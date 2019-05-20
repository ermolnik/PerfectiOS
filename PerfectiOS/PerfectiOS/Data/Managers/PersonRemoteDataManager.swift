//
//  PersonRemoteDataManager.swift
//  PerfectiOS
//
//  Created by Кирилл Худяков on 16/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//


class PersonRemoteDataManager: PersonDataManagerInputDelegate {

    func getPersonList(onError: @escaping (DataManagerInputError) -> Void, onSuccess: @escaping ([Person]) -> Void) {
        RandomService().getGirls(onError: { error in
            onError(.loadingError)
        }) { persons in
          onSuccess(persons)
        }
    }
    
    func save(item: Person) throws {
        
    }
    
}
