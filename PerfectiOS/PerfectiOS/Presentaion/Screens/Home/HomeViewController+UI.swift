//
//  HomeViewController+UI.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import UIKit


extension HomeViewController {
    struct UI {
        var bgTopView: UIView
        var exploreLabel: UILabel
        var titleLabel: UILabel
    }
    
    func addUI() {
        ui = UI.init(bgTopView: UIImageView(image: #imageLiteral(resourceName: "bgTop")),
                     exploreLabel: UILabel(frame: .zero).then { $0.textColor = Constants.Colors.textColor; $0.font = UIFont.systemFont(ofSize: 20, weight: .light); $0.text = "Explore"},
                     titleLabel: UILabel(frame: .zero).then { $0.textColor = Constants.Colors.textColor; $0.font = UIFont.systemFont(ofSize: 18, weight: .bold); $0.text = "UserInfo cards"})
        ui.bgTopView.tintColor = #colorLiteral(red: 0.9185829759, green: 0.1883020699, blue: 0.3306255937, alpha: 1)
        
        view.addSubview(ui.bgTopView)
        view.addSubview(ui.exploreLabel)
        view.addSubview(ui.titleLabel)
        view.backgroundColor = Constants.Colors.backgroundColor
        userCollectionView.configure(dataSource: viewModel)
        viewModel.delegateUpdatable = userCollectionView.collectionView
        view.addSubview(userCollectionView)
        
    }
    
    func setupConstraints() {
        ui.bgTopView.translatesAutoresizingMaskIntoConstraints = false
        ui.bgTopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        ui.bgTopView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        ui.bgTopView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        ui.bgTopView.heightAnchor.constraint(equalToConstant: 209).isActive = true
        
        ui.exploreLabel.translatesAutoresizingMaskIntoConstraints = false
        ui.exploreLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        ui.exploreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21).isActive = true
        
        ui.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        ui.titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        ui.titleLabel.topAnchor.constraint(equalTo: ui.exploreLabel.bottomAnchor, constant: 7).isActive = true
        
        userCollectionView.translatesAutoresizingMaskIntoConstraints = false
        userCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 320).isActive = true
        userCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        userCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        userCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
}
