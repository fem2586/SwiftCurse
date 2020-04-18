//
//  main.swift
//  QuickSort
//
//  Created by Mac on 2020-04-17.
//  Copyright © 2020 classWork. All rights reserved.
//

import Foundation

var exmplArr:Array = [4,2,1,5,6,8,7,9,3]

func quickSort(arraySorted: [Int]) -> [Int] {
    if arraySorted.isEmpty { return [] }
    
    let firstNum = arraySorted.first!
    
    let eqlORsmall = arraySorted.dropFirst().filter { $0 <= firstNum }
    let larger = arraySorted.dropFirst().filter { $0 > firstNum }
    
    return quickSort(arraySorted: eqlORsmall) + [firstNum] + quickSort(arraySorted: larger)
}

print(quickSort(arraySorted: exmplArr))
