import Foundation

func coins(n: Int, a: Int, b: Int, c: Int) -> Double {
    if n < 0 {
        return Double.infinity
    } else if n == 0 {
        return 0.0
    } else {
        return min(
            Double(n), 1 + coins(n: n - a, a: a, b: b, c: c), 1 + coins(n: n - b, a: a, b: b, c: c),
            1 + coins(n: n - c, a: a, b: b, c: c))
    }
}

func main() {
    let clock = ContinuousClock()
    let filename = "out_test2.csv"
    let currentDirectoryPath = FileManager.default.currentDirectoryPath
    let fileUrl = URL(fileURLWithPath: currentDirectoryPath).appendingPathComponent(filename)

    var outText = ""

    for i in 10...100 {
        let time = clock.measure {
            let nr = coins(n: i, a: 5, b: 6, c: 7)
            print("\(i), \(nr)")
        }
        outText += "\(i), \(time)\n"
    }
    do {
        try outText.write(to: fileUrl, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file")
    }
}

main()
