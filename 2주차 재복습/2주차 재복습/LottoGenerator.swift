//
//  LottoGenerator.swift
//  2주차 재복습
//
//  Created by Jack Lee on 2023/07/05.
//

import Foundation

// 내가 찍은 번호들
let myLottoNumbers: Set<Int> = [1,2,3,4,5,6]
var chosenNumbers = Set<Int>()

/// 당첨 번호와 일치하는지 검사 필요
// 로또 당첨 번호 생성 함수 구성
func lottoGenerator() {
    repeat {
        let pickedNumber = Int.random(in: 1...45)
        chosenNumbers.insert(pickedNumber)
    } while chosenNumbers.count < 6
}

func lottoChecker() {
    let matchingNumbers = chosenNumbers.intersection(myLottoNumbers)
                                       .map({ String($0)})
                                       .joined(separator: ", ")
    if matchingNumbers.count != 0 {
        print("축하합니다! 겹치는 번호는 \(matchingNumbers) 입니다!")
    } else {
        print("아쉽지만 겹치는 번호가 없습니다.")
    }
}

