//
//  Matrix.swift
//  Levenshtein-Distance
//
//  Created by yurii zhuk on 6/7/18.
//  Copyright © 2018 yurii zhuk. All rights reserved.
//

import Foundation

class Matrix<Value> {
    
    private(set) var columns: Int
    private(set) var rows: Int
    
    private var backstage: [Value?]
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        self.backstage = Array(repeating: nil, count: columns * rows)
    }
    
    subscript(column: Int, row: Int) -> Value? {
        get {
            return self.backstage[self.columns * row + column]
        }
        set {
            self.backstage[self.columns * row + column] = newValue
        }
    }
}
