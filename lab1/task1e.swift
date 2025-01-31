let n = Int(readLine()!)!
let a = Int(readLine()!)!
let b = Int(readLine()!)!
let c = Int(readLine()!)!

var ar: [Double] = Array(repeating: Double.infinity, count: Int(n + 1))
ar[0] = 0

func coins(n: Int) -> Double {
    for i in stride(from: 1, to: n + 1, by: 1) {
        if i >= 1 {
            ar[i] = min(ar[i], 1 + (ar[i - 1]))
        }
        if i >= a {
            ar[i] = min(ar[i], 1 + (ar[i - a]))
        }
        if i >= b {
            ar[i] = min(ar[i], 1 + (ar[i - b]))
        }
        if i >= c {
            ar[i] = min(ar[i], 1 + (ar[i - c]))
        }
    }

    return ar[n]
}

print(Int(coins(n: n)))