//
//  Constants.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import UIKit


enum Constants {
    
    enum API {
        
    }

    enum Colors {
        static let backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        static let textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
}


func printError(with item: Any...) {
    print("\n❌ error: ", item)
}
