//
//  main.swift
//  project-euler
//
//  Created by Matthew on 03/03/2016.
//  Copyright © 2016 Automata Theory. All rights reserved.
//

import Foundation

let projectName = "projecteuler"

if(Process.arguments.count != 2) {
    print("project-euler [int]")
} else {
    let cName = "\(projectName).P\(Process.arguments[1])"
    
    if let p = ProblemFactory.create(cName) {
        let sTime = CFAbsoluteTimeGetCurrent()
        let ans = p.solve()
        let elapsedTime = CFAbsoluteTimeGetCurrent() - sTime
        print("Problem: \(ans), time interval: \(elapsedTime)")
    } else {
        print("problem not found")
    }
}

