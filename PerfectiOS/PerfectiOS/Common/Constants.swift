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
        static let host = "https://randomuser.me"
    }

    enum Colors {
        static let backgroundColor = #colorLiteral(red: 0.3293711543, green: 0.3294345438, blue: 0.3293717802, alpha: 1)
        static let textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
}

func printError(with item: Any...) {
    print("\n❌ error: ", item)
}
