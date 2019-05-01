//
//  HomeViewController.swift
//  PerfectiOS
//
//  Created by Кирилл Худяков on 30/04/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import UIKit

extension UILabel: Then {}

class HomeViewController: UIViewController {

    var ui: UI!
    var userCollectionView: UsersCollectionView = UsersCollectionView()
    var viewModel: HomeViewModel = HomeViewModel()
    
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .green
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadData()
        
        addUI()
        setupConstraints()
    }

    
}
