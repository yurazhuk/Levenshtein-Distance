//
//  Operation .swift
//  Levenshtein-Distance
//
//  Created by yurii zhuk on 6/6/18.
//  Copyright © 2018 yurii zhuk. All rights reserved.
//

import Foundation

enum Operations<Element>{
    case Delete(index: Int)
    case Insert(index: Int, element: Element)
    case Substitute(index: Int, element: Element)
    case DoNothing
    
    var distance: Int {
        switch self {
        case .DoNothing:
            return 0
        default:
            return 1
        }
    }
}


