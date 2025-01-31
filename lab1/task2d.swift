import Foundation

var k = 0.0
var p = 0.99

@discardableResult
func g(x: Double) -> Double {
    if x < k {
        return 0.0
    } else if x == k {
        return pow(p, k)
    } else {
        return g(x: x - 1) + pow(p, k) * (1 - p) * (1 - g(x: x - k - 1))
    }
}


let clock = ContinuousClock()
var outText = ""
let filename = "out_test4_repeat.csv"
let currentDirectoryPath = FileManager.default.currentDirectoryPath
let fileUrl = URL(fileURLWithPath: currentDirectoryPath).appendingPathComponent(filename)

for i in stride(from: 10, through: 10000, by: 2) {
    let n = Double(i)
    k = n / 2

    let time = clock.measure {
        g(x: n)
    }
    outText += "\(n), \(time)\n"

    do {
        try outText.write(to: fileUrl, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file")
    }
}
