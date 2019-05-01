//
//  PersonCell.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import UIKit


class PersonCell: UICollectionViewCell {
    static let height: CGFloat = 90
    static let reusableIdentifier = "PersonCell"
    
    var imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
