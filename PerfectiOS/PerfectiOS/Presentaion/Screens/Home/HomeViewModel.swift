//
//  HomeViewModel.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewModel: NSObject {
    
    var persons: [Person] = []
    weak var delegateUpdatable: UICollectionView?
    
    func loadData() {
        
        RandomService().getGirls(onError: { error in
            printError(with: "\(error.localizedDescription)")
        }) { girls in
            self.persons = girls
            self.persons.forEach {
                print($0)
            }
            
            if let delegateUpdatable = self.delegateUpdatable {
                DispatchQueue.main.async {
                    delegateUpdatable.reloadData()
                }
            }
        }
    }
    
}

extension HomeViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return persons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            PersonCell.reusableIdentifier, for: indexPath) as? PersonCell {
            
            let person = persons[indexPath.row]
            cell.backgroundColor = .white
            cell.layer.cornerRadius = PersonCell.height / 2
            cell.imageView.layer.cornerRadius = PersonCell.height / 2
            cell.clipsToBounds = true
            
            if let pictureLink = person.pictureLink {
                cell.imageView.kf.setImage(with: URL(string: pictureLink))
                
            } else {
                cell.imageView.image = #imageLiteral(resourceName: "girlFace")
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
}


