//
//  PrimeUtil.swift
//  project-euler
//
//  Created by Matthew on 07/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

import Foundation
import Darwin

/*
    Class with some common, reusable prime utilities
    Helpful resource: http://stackoverflow.com/a/1072205
*/
class PrimeUtil {
    
    class func sieveOfEratosthenes(upTo n: Int) -> [Int] {
        var numbers = [Int](2..<n)

        for i in 0..<n-2 {
            guard numbers[i] > 0 else { continue }
            let prime = numbers[i]
            for multiple in (2*prime-2).stride(to: n-2, by: prime) {
                numbers[multiple] = 0
            }
        }
        
        return numbers.filter({$0 > 0})
    }
    
    class func sieveOfEratosthenes(through n: Int) -> [Int] {
        var numbers = [Int](2...n)
        
        for i in 0..<n-2 {
            guard numbers[i] > 0 else { continue }
            let prime = numbers[i]
            for multiple in (2*prime-2).stride(to: n-2, by: prime) {
                numbers[multiple] = 0
            }
        }
        
        return numbers.filter({$0 > 0})
    }
    
    class func generatePrimesNaive(through n: Int) -> Int {
        var primes = [Int](arrayLiteral: 2)
        
        var next = 3
        while(primes.count < n) {
            let throughVal = sqrt(next) + 1
            let isPrime = sieveOfEratosthenes(through: throughVal)
                .filter({ next % $0 == 0}).count == 0
            if(isPrime) { primes.append(next) }
            next += 1
        }

        return primes.last!
    }
    
    /*
    Trial division method of factorization: https://en.wikipedia.org/wiki/Trial_division
    */
    class func primeFactors(integer: Int) -> [Int] {
        var n = integer
        var pFactors: Set<Int> = []
        
        if n < 2  { return [] }
        
        for p in sieveOfEratosthenes(upTo: sqrt(n) + 1) {
            if p * p > n { break }
            
            while n % p == 0 {
                pFactors.insert(p)
                n = n / p
            }
        }
        if(n > 1) { pFactors.insert(n) }
        
        return pFactors.sort()
    }
    
    class func primeFactorsWithPowers(integer:Int) -> [PrimeFactor] {
        var n = integer
        
        if n < 2  { return [] }
        
        var pFactors: [Int] = [Int](sieveOfEratosthenes(upTo: n))
        var pPowers: [Int] = [Int].init(count: pFactors.count, repeatedValue: 0)
        
        for (i, p) in pFactors.enumerate() {
            while n % p == 0 {
                pPowers[i]++
                n = n / p
            }
        }
        if(n > 1) {
            pFactors.append(n)
            pPowers.append(1)
        }
        
        return Array(Zip2Sequence(pFactors, pPowers))
            .flatMap({ PrimeFactor(prime: $0, power: $1)})
            .filter( { $0.power > 0 })
    }
}

func sqrt(x: Int) -> Int { return Int(Darwin.sqrt(Double(x))) }
func pow(x: Int, pow: Int) -> Int { return Int(Darwin.pow(Double(x), Double(pow)))}

struct PrimeFactor {
    let prime: Int
    let power: Int
}

