//
//  main.swift
//  CodeStarterCamp_Week2
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var roundOfLotto = 0
var lottoWinningNumberList = [String: [Int]]()
let myLottoNumbers = [1, 2, 3, 4, 5, 6]

func createLottoNumbers() {
    roundOfLotto += 1
    var lottoNumbers = Set<Int>()
    while lottoNumbers.count < 6 {
        lottoNumbers.insert(Int.random(in: 1...45))
    }
    storeLottoNumberList(using: roundOfLotto, and: lottoNumbers)
}

func checkWinning(with lottoNumbers: Set<Int>, and myNumbers: [Int]) -> [String] {
    let sortedLottoNumbers = lottoNumbers.sorted()
    var sameNumbers: [String] = []
    
    for lottoNumber in sortedLottoNumbers {
        if myLottoNumbers.contains(lottoNumber) {
            sameNumbers.append(String(lottoNumber))
        }
    }
    return sameNumbers
}

func showResult(use sameNumbers: [String]) {
    if sameNumbers.isEmpty {
        print("아쉽지만 겹치는 번호가 없습니다.")
    } else {
        print("축하합니다! 겹치는 번호는 \(sameNumbers.joined(separator: ", ")) 입니다!")
    }
}

func storeLottoNumberList(using round: Int, and lottoNumbers: Set<Int>) {
    lottoWinningNumberList["\(round)회차"] = lottoNumbers.sorted()
}

func findLottoNumberList(round: Int) {
    if let winningNumbers = lottoWinningNumberList["\(round)회차"] {
        let convertedWinningNumbers = winningNumbers.map{ String($0) }.joined(separator: ", ")
        print("\(round)회차의 로또 당첨 번호는 \(convertedWinningNumbers) 입니다.")
    } else {
        print("\(round)회차의 로또가 아직 진행되지 않았습니다.")
    }
}

//play proceed
func playLotto(for times: Int) {
    for _ in 1...times {
        createLottoNumbers()
    }
}

playLotto(for: 5)
findLottoNumberList(round: 2)
