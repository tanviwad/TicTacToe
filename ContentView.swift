//
//  ContentView.swift
//  TicTacToe
//
//  Created by Tanvi Wadhawan on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = [ "" , "" , "" , "" , "" , "" , "" , "" , "" ]
    @State private var endGameText = "TicTacToe"
    @State private var gameEnded = false
    private var ranges = [(0..<3),(3..<6),(6..<9)]
    var body: some View {
        VStack {
            Text(endGameText)
                .alert(endGameText, isPresented: $gameEnded){
                    Button("Reset", role: .destructive, action: resetGame)
                }
            Spacer()
            //game
            ForEach(ranges, id: \.self){ range in
                HStack{
                    ForEach(range, id: \.self){ i in
                        XOButton(letter: $moves[i])
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded{ _ in
                                        print("Tap: \(i)")
                                        playerTap(index: i)
                                    }
                            )
                    }//0-3 then 3-6 then 6-9
                }
            }
            Spacer()
            Button("Reset"){
                resetGame()
            }
        }
    }
    func playerTap(index: Int){
        if moves[index] == ""{
            moves[index] = "X"
            botMove()
        }
        for letter in ["O", "X"]{
            if checkWinner(list: moves, letter: letter){
                endGameText = "\(letter) has won"
                gameEnded = true
                break
            }
        }
    }
    func botMove(){
        var availableMoves: [Int] = []
        var movesLeft = 0
        for move in moves{
            if move == "" {
                availableMoves.append(movesLeft)
            }
            movesLeft += 1
        }
        if availableMoves.count != 0 {
            moves[availableMoves.randomElement()!] = "O"
        }
    }
    func resetGame(){
        endGameText = "TicTacToe"
        moves = ["", "","","", "","","", "",""]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
