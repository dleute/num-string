//
//  main.swift
//  swift-numbers
//
//  Created by Derrek Leute on 11/5/14.
//  Copyright (c) 2014 Derrek Leute. All rights reserved.
//

import Foundation

func formatString(string: String) -> String {
    // Removes spaces
    return string.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
}

func processInput(string: String, print: Bool = true) {
    let strings = formatString(string).componentsSeparatedByString(",")
    var numbers = Array<Int>()
    
    // This prevents multiple int conversions later saving time.
    for (var s = 0; s < strings.count; s++) {
        numbers.append(strings[s].toInt()!)
    }
    
    var combinations = Array<Array<Int>>()
    
    for (var i = 0; i < numbers.count; i++ ) {
        let n1 = numbers[i]
        for (var i2 = 0; i2 < numbers.count; i2++ ) {
            if ( i != i2) {
                let n2 = numbers[i2]
                var add = n1 + n2
                if (add == 10) {
                    var pair = [n1, n2]
                    combinations.append(pair)
                }
            }
        }
    }
    
    var same = Array<Array<Int>>()
    var exact = Array<Array<Int>>()
    

    for p1 in combinations {
        
        var isExact = false
        for p3 in exact {
            if ( p1 == p3 ) {
                isExact = true
                break
            }
        }
        
        if (!isExact) {
            exact.append(p1)
        }
        
        var isSame = false
        for p4 in same {
            if ( p1[0] == p4[0] || p1[0] == p4[1] ) {
                isSame = true
                break
            }
        }
        
        if (!isSame) {
            same.append(p1)
        }
        
    }
    
    if (print) {
        println("1) \(combinations)")
        println("2) \(exact)")
        println("3) \(same)")
    }
}

// Unlike java, swift does not require a main entry point. So the logic starts here.

if (Process.arguments.count > 3 && Process.arguments[2] == "performance") {
    
    let loop = Process.arguments[3].toInt()!
    
    // Provides the performance testing
    
    let startDate = NSDate()
    
    for (var i = 0; i<loop; i++) {
        processInput("1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9", print: false)
    }
    
    let endDate = NSDate()
    let exec = endDate.timeIntervalSinceDate(startDate)
    let perf = NSString(format:"%.1f", Double(loop)/exec)
    
    println("Per Second: \(perf) Total: \(exec)")
    
} else if Process.arguments.count > 1 {
    
    processInput(Process.arguments[1], print: true)
    
} else {
    println("Please provide a list of numbers: '1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9'")
}