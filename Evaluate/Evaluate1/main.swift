//
//  main.swift
//  Evaluate1
//
//  Created by Mac on 2020-04-17.
//  Copyright © 2020 classWork. All rights reserved.
//

import Foundation

func evaluateSt(_ inputString: String)-> String
{
    var input = inputString
    input = input.replacingOccurrences(of: " ", with: "")
    let fIndex = input.firstIndex(of: ")")
    var res = ""
    
    if let firstIndex = fIndex
    {
        let partOfStr = input[..<firstIndex]
        let uniteFirstInd = String(partOfStr).lastIndex(of: "(")
        var evaluateStr = input[uniteFirstInd!...firstIndex]
        evaluateStr.remove(at: firstIndex)
        evaluateStr.remove(at: uniteFirstInd!)
        input = input.replacingOccurrences(of: "("+String(evaluateStr)+")", with:  evaluateSt(String(evaluateStr)))
        res = evaluateSt(input)
    }
    else
    {
        res = input
        let multiply = input.split(separator: "*")
        if multiply.count > 1
        {
            res = multiply.reduce("")
            {
                var n1 = Int($0)
                var n2 = Int($1)
                            
                if n1 == nil { n1 = Int(evaluateSt($0))
                if n1 == nil { return String($1)                  }}
                            
                if n2 == nil { n2 = Int(evaluateSt(String($1)))    }
                return String(n1!*n2!)
            }
        }
        let divided = input.split(separator: "/")
        if divided.count > 1
        {
            res = divided.reduce("")
            {
                var n1 = Int($0)
                var n2 = Int($1)
                        
                if n1 == nil { n1 = Int(evaluateSt($0))
                if n1 == nil { return String($1)                  }}
                        
                if n2 == nil { n2 = Int(evaluateSt(String($1))) }
                return String(n1!/n2!)
            }
        }
        let plus = input.split(separator: "+")
        if plus.count > 1
        {
            res = plus.reduce("")
            {
                var n1 = Int($0)
                var n2 = Int($1)
                            
                if n1 == nil { n1 = Int(evaluateSt($0))
                if n1 == nil { return String($1)}    }
                        
                if n2 == nil{n2 = Int(evaluateSt(String($1))) }
                return String(n1!+n2!)
            }
        }
        let minus = input.split(separator: "-")
        if minus.count > 1
        {
            res = minus.reduce("")
            {
                var n1 = Int($0)
                var n2 = Int($1)
                            
                if n1 == nil { n1 = Int(evaluateSt($0))
                if n1 == nil { return String($1)               }}
                            
                if n2 == nil{ n2 = Int(evaluateSt(String($1)))  }
                return String(n1!-n2!)
            }
        }
    }
    return res
}

print(evaluateSt(("7"                )))
print(evaluateSt(("(2+2)"            )))
print(evaluateSt(("(1+(2*4))"        )))
print(evaluateSt(("((1+3)+((1+2)*5))")))

    
    
