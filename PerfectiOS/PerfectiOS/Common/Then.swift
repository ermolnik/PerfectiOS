//
//  Then.swift
//  PerfectiOS
//
//  Created by Kirill Khudiakov on 01/05/2019.
//  Copyright © 2019 Fun. All rights reserved.
//

import Foundation


protocol Then {
    
}

extension Then where Self: AnyObject {
    func then(block: (Self)->Void) -> Self {
        block(self)
        return self
    }
}


