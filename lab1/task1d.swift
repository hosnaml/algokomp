import Foundation

let a = 5.0
let b = 6.0
let c = 7.0
var globalHashMap: [Double: Double] = [:]

func coins(n: Double) -> Double {
    if n < 0 {
        return Double.infinity
    } else if n == 0 {
        return 0.0
    } else if let mapContent = globalHashMap[n] {
        return mapContent
    } else {
        let result = min(Double(n), 1 + coins(n: n - a), 1 + coins(n: n - b), 1 + coins(n: n - c))
        globalHashMap[n] = result
        return result
    }
}

let clock = ContinuousClock()

let filename = "out_test4_small.csv"
let currentDirectoryPath = FileManager.default.currentDirectoryPath
let fileUrl = URL(fileURLWithPath: currentDirectoryPath).appendingPathComponent(filename)

var outText = ""

for i in 10...100000 {
    let iter = Double(i)
    let time = clock.measure {
        let nr = coins(n: iter)
        print("\(i), \(nr)")
    }
    outText += "\(i), \(time)\n"
}
do {
    try outText.write(to: fileUrl, atomically: true, encoding: .utf8)
} catch {
    print("Error writing to file")
}
