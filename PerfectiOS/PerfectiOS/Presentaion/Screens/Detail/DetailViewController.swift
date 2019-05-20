//
//  DetailViewController.swift
//  PerfectiOS
//
//  Created by Кирилл Худяков on 16/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

protocol DetailViewControllerDelegate: class {
    func detailViewControllerDidBack()
}


class DetailViewController: UIViewController {
    
    var photoImageView: UIImageView = UIImageView(frame: .zero)
    var nameLabel: UILabel = UILabel(frame: .zero)
    
    weak var delegate: DetailViewControllerDelegate?
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        addUI()
        setupConstraints()
        
        
    }
    
    func addUI() {
        view.addSubview(photoImageView)
        view.addSubview(nameLabel)
    }
    
    func setupConstraints() {
        photoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.leadingAnchor,
                              padding: UIEdgeInsets(top: 20, left: 20, bottom: 150, right: 150),
                              size: CGSize(width: 150, height: 150))
        nameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         leading: photoImageView.trailingAnchor,
                         trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 20))
    }
    
    func configure(with person: Person) {
        self.person = person
        nameLabel.text = person.name
        photoImageView.image = #imageLiteral(resourceName: "no-image")
        
        print(person)
        
        nameLabel.textColor = .white
        if let pictureUrl = person.pictureUrl {
            photoImageView.kf.setImage(with: URL(string: pictureUrl))
        }
        
        photoImageView.layer.cornerRadius = 8
        photoImageView.layer.masksToBounds = true
//        photoImageView.image = UIImage(data: photo)
    }
    
}

