import Cocoa

// SWIFT CLOSURES

let luckyNumbers0 = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func isUneven0(number: Int) -> Bool {
    if number % 2 == 1 {
        return true
    }
    return false
}

let unevenNumbers0 = luckyNumbers0.filter(isUneven0)

func ascendingOrder0(a: Int, b: Int) -> Bool {
    return a < b
}

let sortedNumbers0 = unevenNumbers0.sorted(by: ascendingOrder0)

func mapNumber0(number: Int) -> String {
    return "\(number) is a lucky number"
}

let mappedNumbers0 = sortedNumbers0.map(mapNumber0)

// ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

let luckyNumbers1 = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let isUneven1 = { (number: Int) -> Bool in
    return !number.isMultiple(of: 2)
}

let unevenNumbers1 = luckyNumbers1.filter(isUneven1)

let ascendingOrder1 = { (a: Int, b: Int) -> Bool in
    return a < b
}

let sortedNumbers1 = unevenNumbers1.sorted(by: ascendingOrder1)

let mapNumber1 = { (number: Int) -> String in
    return "\(number) is a lucky number"
}

let mappedNumbers1 = sortedNumbers1.map(mapNumber1)

// ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

let luckyNumbers2 = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let unevenNumbers2 = luckyNumbers2.filter({ (number: Int) -> Bool in
    !number.isMultiple(of: 2)
})

let sortedNumbers2 = unevenNumbers2.sorted(by: { (a: Int, b: Int) -> Bool in
    a < b
})

let mappedNumbers2 = sortedNumbers2.map({ (number: Int) -> String in
    "\(number) is a lucky number"
})

// ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

let luckyNumbers3 = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let unevenNumbers3 = luckyNumbers3.filter { !$0.isMultiple(of: 2) }

let sortedNumbers3 = unevenNumbers3.sorted { $0 < $1 }

let mappedNumbers3 = sortedNumbers3.map { "\($0) is a lucky number" }

// ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

let result = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49].filter { !$0.isMultiple(of: 2) }.sorted().map { "\($0) is a lucky number" }

for item in result {
    print(item)
}
print()
