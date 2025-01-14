let n = Double(readLine()!)!
let a = Double(readLine()!)!
let b = Double(readLine()!)!
let c = Double(readLine()!)!

func coins(n: Double) -> Double {
    if n < 0 {
        return Double.infinity
    } else if n == 0 {
        return 0.0
    } else {
        return min(Double(n), 1 + coins(n: n - a), 1 + coins(n: n - b), 1 + coins(n: n - c))
    }
}

func greedyCoins(n: Double) {
    return
}

print(coins(n: n))