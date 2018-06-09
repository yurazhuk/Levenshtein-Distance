//
//  EditOperationChain.swift
//  Levenshtein-Distance
//
//  Created by yurii zhuk on 6/7/18.
//  Copyright © 2018 yurii zhuk. All rights reserved.
//

import Foundation

class EditOperationChain<Element> {
    typealias ConcreteEditOperation = Operations<Element>
    typealias ConcreteEditOperationChain = EditOperationChain<Element>
    
    private(set) var current: ConcreteEditOperation
    private(set) var previousChain: ConcreteEditOperationChain? = nil
    private(set) var distance: Int = 0
    
    init(current: ConcreteEditOperation, previousChain: ConcreteEditOperationChain? = nil) {
        self.current = current
        self.previousChain = previousChain
        
        self.distance = (self.previousChain?.distance ?? 0) + current.distance
    }
}
