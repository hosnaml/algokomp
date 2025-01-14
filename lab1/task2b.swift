import Foundation

var k = 0
let p = 0.99

@discardableResult
func f(x: Int, y: Int) -> Double {
    if y == 0 {
        return 1.0
    } else if x == 0 && y > 0 {
        return 0.0
    } else {
        return p * f(x: x - 1, y: y - 1) + (1 - p) * f(x: x - 1, y: k)
    }
}


let clock = ContinuousClock()
var outText = ""
let filename = "out_test3.csv"
let currentDirectoryPath = FileManager.default.currentDirectoryPath
let fileUrl = URL(fileURLWithPath: currentDirectoryPath).appendingPathComponent(filename)

for n in stride(from: 10, through: 30, by: 1) {
    k = Int(n / 2)

    let time = clock.measure {
        f(x: n, y: k)
    }
    outText += "\(n), \(time)\n"

    do {
        try outText.write(to: fileUrl, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file")
    }
}
