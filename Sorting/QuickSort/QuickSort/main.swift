//
//  main.swift
//  QuickSort
//
//  Created by Mac on 2020-04-17.
//  Copyright © 2020 classWork. All rights reserved.
//

import Foundation

func quickSort<T : Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    if collection.count <= 1 {
        return collection
    }
    
    let pivotIndex = Int.random(in: 0..<collection.count)
    let pivotValue = collection[pivotIndex]
    var lArr: [T] = [], rArr: [T] = []
    for (index, element) in collection.enumerated() where index != pivotIndex {
        comparator(element, pivotValue) ? lArr.append(element) : rArr.append(element)
    }
    
    var sortedCollection: [T] = []
    sortedCollection.append(contentsOf: quickSort(lArr, comparator))
    sortedCollection.append(pivotValue)
    sortedCollection.append(contentsOf: quickSort(rArr, comparator))
    
    return sortedCollection
}
