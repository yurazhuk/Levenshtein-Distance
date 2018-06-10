class Levenshtein {
    
    private class func min(numbers: Int...) -> Int {
        return numbers.reduce(numbers[0], {$0 < $1 ? $0 : $1})
    }
}

class Array2D {
    var cols:Int, rows:Int
    var matrix: [Int]
    
    init(cols:Int, rows:Int) {
        self.cols = cols
        self.rows = rows
        matrix = Array(repeating:0, count:cols*rows)
    }
    
    subscript(col:Int, row:Int) -> Int {
        get {
            return matrix[cols * row + col]
        }
        set {
            matrix[cols*row+col] = newValue
        }
    }
    
    func colCount() -> Int {
        return self.cols
    }
    
    func rowCount() -> Int {
        return self.rows
    }
}

class LevenshteinDistance {
    private var a: [String.UTF16View.Element]
    private var b: [String.UTF16View.Element]
    private var operationChain = String()
    private var curentValue = 0
    private let dist: Array2D
    
    init (_ aStr: String, _ bStr: String) {
        self.a = Array(aStr.utf16)
        self.b = Array(bStr.utf16)
        self.dist = Array2D(cols: a.count + 1, rows: b.count + 1)
        countDistances()
    }
    
    
    func calculateChains() -> String{
        
        
        
        var bLoop = b.count - 1
        for i in stride(from: a.count, to: 0, by: -1) {
            loop: for j in stride(from: b.count, to: bLoop, by: -1) {
                
                if (curentValue > dist[i-1, j]) {
                    operationChain.append("d")
                    curentValue = dist[i-1, j]
                    print("i", terminator: " ")
                    break loop
                }  else if (curentValue > dist[i, j-1]) {
                    operationChain.append("i")
                    curentValue = dist[i, j-1]
                    print("i", terminator: " ")
                    break loop
                    
                } else if (curentValue > dist[i-1, j-1]) {
                    operationChain.append("s")
                    curentValue = dist[i-1, j-1]
                    print("s", terminator: " ")
                    break loop
                } else {
                    print(dist[i, j], terminator:" ")
                }
                
            }
            if bLoop != 0 {
                bLoop -= 1
            }
            print("\r")
        }
        
        return String(operationChain.reversed())
    }
    
    
    
    private func countDistances() {
        for i in 1...a.count {
            dist[i, 0] = i
        }
        
        for j in 1...b.count {
            dist[0, j] = j
        }
        
        for i in 1...a.count {
            for j in 1...b.count {
                if a[i-1] == b[j-1] {
                    dist[i, j] = dist[i-1, j-1]
                } else {
                    if (dist[i-1, j] + 1 < dist[i, j-1] + 1 && dist[i-1, j] + 1 < dist[i-1, j-1] + 1 ) {
                        dist[i, j] = dist[i-1, j] + 1
                    } else if (dist[i, j-1] + 1  < dist[i-1, j] + 1 && dist[i, j-1] + 1 <  dist[i-1, j-1] + 1) {
                        dist[i, j] = dist[i, j-1] + 1
                    } else {
                        dist[i, j] = dist[i-1, j-1] + 1
                    }
                }
            }
        }
        
        for i in 0...a.count {
            for j in 0...b.count {
                print(dist[i,j], terminator:" ")
            }
            print("\r")
        }
        print("\n")
        
        curentValue = dist[a.count,b.count]
        print("\n")
        
        
    }
}

print(LevenshteinDistance("sitting", "kitten").calculateChains())
print(LevenshteinDistance("враг", "корабель").calculateChains())
//print(LevenshteinDistance("Sunday", "Saturday").calculateChains())
print(LevenshteinDistance("abc", "def").calculateChains())



