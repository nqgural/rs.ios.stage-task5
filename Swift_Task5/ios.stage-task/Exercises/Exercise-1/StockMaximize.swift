import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var wallet = 0
        var shareCount = 0
        for i in 0..<prices.count {
            if i == prices.count-1 {
                wallet += prices[i]*shareCount
                shareCount = 0
                continue
            }
            if prices[i] > prices[i+1] {
                wallet += prices[i]*shareCount
                shareCount = 0
            }
            if prices[i] < prices[i+1] || prices[i] == prices[i+1] {
                wallet -= prices[i]
                shareCount += 1
            }
        }
        return wallet
        
        
    }
}
