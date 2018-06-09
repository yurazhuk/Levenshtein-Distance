//
//  MinumumEditDistanceCalculator.swift
//  Levenshtein-Distance
//
//  Created by yurii zhuk on 6/7/18.
//  Copyright © 2018 yurii zhuk. All rights reserved.
//

import Foundation

class MinumumEditDistanceCalculator<Element: Equatable> {
    typealias ConcreteEditOperation = Operations<Element>
    typealias ConcreteEditOperationChain = EditOperationChain<Element>
    var result = String()
    var before: [Element]
    var after: [Element]
    var matrix: Matrix<EditOperationChain<Element>>!
    
    var operaionsArray = [String]()
    
    init(before: [Element], after: [Element]) {
        self.before = before
        self.after = after
    }
    
    func solve() -> [Operations<Element>] {
        let matrix = Matrix<ConcreteEditOperationChain>(columns: self.before.count + 1, rows: self.after.count + 1)
    
        
        matrix[0, 0] = ConcreteEditOperationChain(
            current: .DoNothing
        )
        
        // Deletions
        if self.before.count > 0 {
            for i in 1...self.before.count {
                matrix[i, 0] = ConcreteEditOperationChain(
                    current: .Delete(index: 0/*i - 1*/),
                    previousChain: matrix[i - 1, 0]
                    
                )
            }
        }
        
        // Insertions
        if self.after.count > 0 {
            for j in 1...self.after.count {
                matrix[0, j] = ConcreteEditOperationChain(
                    current: .Insert(index: 0/*j - 1*/, element: self.after[j - 1]),
                    previousChain: matrix[0, j - 1]
                )
            }
        }
        
        if self.before.count > 0 && self.after.count > 0 {
            for i in 1...self.before.count {
                for j in 1...self.after.count {
                    
                    if self.before[i - 1] == self.after[j - 1] {
                        matrix[i, j] = matrix[i - 1, j - 1]
                        continue
                    }
                    
                    let variants = [
                        matrix[i - 1, j]!,  // deletion
                        matrix[i, j - 1]!,  // insertion
                        matrix[i - 1, j - 1]!  // substitution
                        ] as [ConcreteEditOperationChain]
                    
                    let distances = variants.map { $0.distance }
                    let minimumIndex = distances.index(of: distances.min()!)!
                    let minimumEditChain = variants[minimumIndex]

//TODO: find shortest way in matrix..., deque ConcreteEditOperationChain into strings 
