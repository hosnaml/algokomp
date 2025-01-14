import Foundation

let n = Double(readLine()!)!
let k = Double(readLine()!)!
let p = Double(readLine()!)!

func g(x: Double) -> Double {
    if x < k {
        return 0.0
    } else if x == k {
        return pow(p, k)
    } else {
        return g(x: x - 1) + pow(p, k) * (1 - p) * (1 - g(x: x - k - 1))
    }
}

print(g(x: n))