//
//  Utils.swift
//  TicTacToe
//
//  Created by Tanvi Wadhawan on 1/30/24.
//

import Foundation

func checkWinner(list: [String], letter: String) -> Bool{
    let winningSequences = [//rows to recognize that a player has won
        [0,1,2], [3,4,5], [6,7,8],//horiz then diag then vert
        [0,4,8], [2,4,6],
        [0,3,6], [1,4,7], [2,5,8]
    ]
    for sequence in winningSequences {
        var score = 0
        for match in sequence {
            if list[match] == letter {
                score += 1
                if score == 3 {
                    print("\(letter) has won!")
                    return true//game ended
                }
            }
        }
    }
    return false //draw
}
