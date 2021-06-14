import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func findMaxKilometres() -> Int {

        func knapSack(p: Int, array: [Supply]) -> [[Int]] {
            let n = array.count
            var t = Array(repeating: Array(repeating: 0,count: p+1), count: n+1)
            for i in 0..<n+1 {
                for j in 0..<p+1 {
                    if i == 0 || j == 0 {
                        t[i][j] = 0
                    } else if array[i-1].weight<=j {
                        t[i][j] = max(array[i-1].value + t[i-1][j-array[i-1].weight],
                                      t[i-1][j])
                    } else {
                        t[i][j] = t[i-1][j]
                    }
                }
            }
            
            return t
        }
        let foodPack = knapSack(p: maxWeight, array: foods)[knapSack(p: maxWeight, array: foods).count-1]
        let drinkPack = knapSack(p: maxWeight, array: drinks)[knapSack(p: maxWeight, array: drinks).count-1]
        var resultArray = [Int]()
        
        for i in 0..<foodPack.count {
            if foodPack[i]<drinkPack[drinkPack.count-1-i] {
                resultArray.append(foodPack[i])
            } else {
                resultArray.append(drinkPack[drinkPack.count-1-i])
            }
        }
                
        
        
        
        
        return resultArray.max()!
    }
}
