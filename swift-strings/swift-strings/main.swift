//
//  main.swift
//  vip-strings
//
//  Created by Derrek Leute on 11/5/14.
//  Copyright (c) 2014 Derrek Leute. All rights reserved.
//

import Foundation

func formatString(string: String) -> String {
    // Removes spaces and lowercases string for processing
    // I intentionally did not handle other data validation for characters besides space
    // I felt that the test was not about validating data so much as the logic to test valid data
    
    return string.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
}

func processInput(string1: String, string2: String, print: Bool = true) {

    // Formats the strings
    let string1_formatted = formatString(string1)
    let string2_formatted = formatString(string2)
    
    // Reverses string into array that can be compared
    var reverseArray1 = reverse(string1_formatted)
    var reverseArray2 = reverse(string2_formatted)
    
    // Sorts the array for anagram logic
    var sortedArray1 = sorted(reverseArray1)
    var sortedArray2 = sorted(reverseArray2)
    
    // Defaults all booleans to false
    var arePalindromes = false
    var onePalindrome = false
    var areAnagrams = false
    var string1Palindrome = false
    var string2Palindrome = false
    
    // Does individual testing to reduce comparison logic
    // Reverses the reverse and compares as it is likely faster than string manipulation
    if (reverseArray1 == reverse(reverseArray1)) {
        string1Palindrome = true
    }
    
    if (reverseArray2 == reverse(reverseArray2)) {
        string2Palindrome = true
    }
    
    // Tests for 1)
    if ( string1Palindrome && string2Palindrome ) {
        arePalindromes = true
    }
    
    // Tests for 2)
    if ( (string1Palindrome || string2Palindrome) && !arePalindromes ) {
        onePalindrome = true
    }
    
    // Tests for 3)
    // Swift allows comparison of complex types that are hashable.
    if (sortedArray1 == sortedArray2) {
        areAnagrams = true
    }
    
    // The following are the outputs for the 5 tests
    // 4 and 5 use existing booleans directly
    
    // Only prints if running in single entry mode
    // Batch mode should not print results as it is just for query performance
    if print {
        
        if (arePalindromes) {
            println("1) true")
        } else {
            println("1) false")
        }
        
        if (onePalindrome) {
            println("2) true")
        } else {
            println("2) false")
        }
        
        if (areAnagrams) {
            println("3) true")
        } else {
            println("3) false")
        }
        
        if (arePalindromes && areAnagrams) {
            println("4) true")
        } else {
            println("4) false")
        }
        
        if ((!arePalindromes && !onePalindrome) && !areAnagrams) {
            println("5) true")
        } else {
            println("5) false")
        }
    }
}

// Only executes if both parameters are provided
if (Process.arguments.count > 4 && Process.arguments[3] == "performance") {
    
    let loop = Process.arguments[4].toInt()!
    
    // Provides the performance testing

    let startDate = NSDate()
    
    for index in 1...loop {
        processInput(Process.arguments[1], Process.arguments[2], print: false)
    }
    
    let endDate = NSDate()
    let exec = endDate.timeIntervalSinceDate(startDate)
    let perf = NSString(format:"%.1f", Double(loop)/exec)
    
    println("Per Second: \(perf) Total: \(exec)")
    
} else if Process.arguments.count > 2 {
    
    processInput(Process.arguments[1], Process.arguments[2], print: true)
    
} else {
    println("Please provide two quoted arguments like this: 'Race car' 'Elite Tile'")
}
