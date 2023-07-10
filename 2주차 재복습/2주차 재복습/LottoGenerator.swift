//
//  LottoGenerator.swift
//  2주차 재복습
//
//  Created by Jack Lee on 2023/07/05.
//

import Foundation

// 내가 찍은 번호들
let winningLottoNumbers: Set<Int> = [1,2,3,4,5,6]

func rollLotto() -> Set<Int> {
    var chosenNumbers = Set<Int>()

    repeat {
        let pickedNumber = Int.random(in: 1...45)
        chosenNumbers.insert(pickedNumber)
    } while chosenNumbers.count < 6
    
    return chosenNumbers
}

func playLotto(rounds: Int) {
    for round in 1...rounds {
        let lottoDrawn = rollLotto()
        saveLotto(of: round, numbers: lottoDrawn)
    }
}

func saveLotto(of round: Int, numbers: Set<Int>) {
    var savedData: Dictionary<Int, Set<Int>> = [:]
    
    savedData[round] = numbers
    print("\(round)회차의 숫자는 \(numbers.map({String($0)}).joined(separator: ", ")) 입니다.")
}
