//
//  chip8.swift
//  Chip-8
//
//  Created by Fredrik Pihlström on 2019-04-16.
//  Copyright © 2019 Göteborgs Relief. All rights reserved.
//

import Foundation


struct Display {
    let rows: Int, columns: Int
    var grid: [UInt8]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> UInt8 {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}


struct Chip8 {
    let programstart = 0x200
    let stacksize = 16
    
    var memory:[UInt8]
    var registers: [UInt8]
    var display: Display
    var stack: [UInt8]
    var PC: UInt16
    var SP: UInt8
    
    init(memsize: Int = 4096) {
        memory = Array(repeating: 0, count: memsize)
        registers = Array(repeating: 0, count: 16)
        self.display = Display(rows: 32, columns: 64)
        PC = 0
        SP = 0
        stack = Array(repeating: 0, count: self.stacksize)
    }
    
    
}

