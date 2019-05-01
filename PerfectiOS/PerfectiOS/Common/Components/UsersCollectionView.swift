//
//  UsersCollectionView.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import UIKit


class UsersCollectionView: UIView {
    
    var collectionView: UICollectionView!
    var collectionLabel: UILabel!
    
    var layout = UICollectionViewFlowLayout()
    
    init() {
        super.init(frame: .zero)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UsersCollectionView {
    func configure(dataSource: UICollectionViewDataSource) {
        
        layout.itemSize = CGSize(width: PersonCell.height, height: PersonCell.height)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 16)
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PersonCell.self, forCellWithReuseIdentifier: PersonCell.reusableIdentifier)
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        addSubview(collectionView)
        
        collectionLabel = UILabel(frame: .zero).then {
            $0.text = "User's info";
            $0.textColor = #colorLiteral(red: 0.9185829759, green: 0.1883020699, blue: 0.3306255937, alpha: 1)
            $0.font = UIFont.systemFont(ofSize: 18)
        }
        addSubview(collectionLabel)
        
        collectionLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        collectionLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -40).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
