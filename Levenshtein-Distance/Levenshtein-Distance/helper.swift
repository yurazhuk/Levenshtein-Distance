//
//  helper.swift
//  Levenshtein-Distance
//
//  Created by yurii zhuk on 6/9/18.
//  Copyright © 2018 yurii zhuk. All rights reserved.
//

import Foundation

func getResult(_ first: String, _ second: String) ->  String{
    let result = MinumumEditDistanceCalculator(before:Array(first), after: Array(second)).solve()
    var ouput = String()


        
        
//        switch value {
//        case .Delete(index: value.distance):
//            ouput.append("d")
//        case .Substitute(index: value.distance, element: "e"):
//            ouput.append("s")
//        case .Insert(index: value.distance, element: value as ):
//            ouput.append("i")
//        default:
//            print(ouput)
//        }
    }
    
    return ouput
}
