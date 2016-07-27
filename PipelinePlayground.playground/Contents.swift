//: Playground - noun: a place where people can play

import UIKit

public func compose<T, U, V>(first: (T) -> U, second: (U) -> V) -> (T) -> V  {
    
    return { value in
        
        let transformed = first(value)
        
        return second(transformed)
    }
}

func addFive(int: Int) -> Int {
    
    return int + 5
}

func toString(int: Int) -> String {
    
    return "\(int)"
}


let addFiveString = compose(first: addFive, second: toString)

addFiveString(3)


func sum(array: [Int]) -> Int {
    
    return array.reduce(0, combine: { (value, total) -> Int in
        
        return value + total
    })
}



infix operator |> { precedence 95 associativity left }

public func |> <T, U, V>(lhs: (T) -> U, rhs: (U) -> V) -> (T) -> V  {
    
    return compose(first: lhs, second: rhs)
}


let sumPlusFiveString = sum |> addFive |> toString

sumPlusFiveString([1, 2, 3])