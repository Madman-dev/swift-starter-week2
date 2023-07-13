//
//  LottoGenerator.swift
//  2주차 재복습
//
//  Created by Jack Lee on 2023/07/05.
//

import Foundation

// 내가 찍은 번호들
//let winningLottoNumbers: Set<Int> = [1,2,3,4,5,6]
//var savedData: Dictionary<Int, Set<Int>> = [:]
//
//func rollLotto() -> Set<Int> {
//    var chosenNumbers = Set<Int>()
//
//    repeat {
//        let pickedNumber = Int.random(in: 1...45)
//        chosenNumbers.insert(pickedNumber)
//    } while chosenNumbers.count < 6
//
//    return chosenNumbers
//}
//
//func playLotto(rounds: Int) {
//    for round in 1...rounds {
//        let lottoDrawn = rollLotto()
//        saveLotto(of: round, numbers: lottoDrawn)
//    }
//}
//
//func saveLotto(of round: Int, numbers: Set<Int>) {
////    var savedData: Dictionary<Int, Set<Int>> = [:]
//
//    savedData[round] = numbers
//    print("\(round)회차의 숫자는 \(numbers.map({String($0)}).joined(separator: ", ")) 입니다.")
//}


//MARK: - 3번 재구현

let winningNumbers: Set = [1,2,3,4,5,6]
var previousWinners: Dictionary<Int, Set<Int>> = [:]

func numberPicker() -> Set<Int> {
    var chosenNumbers = Set<Int>()

    repeat {
        let pickedNumber = Int.random(in: 1...45)
        chosenNumbers.insert(pickedNumber)
    } while chosenNumbers.count < 6

    return chosenNumbers
}

func playLotto(rounds: Int?) {
    guard let rounds = rounds, rounds > 0 else {
        print("round 수가 0보다 크도록 설정해주세요");
        return }

    for round in 1...rounds {
        let numberDrawn = numberPicker()
        saveWinners(won: round, with: numberDrawn)  // 플레이를 할 때 바로 값을 저장할 수 있도록 실행 ++ But... 하나의 함수가 하나의 행동만 한다면 이 친구는 어떻게 해야하지?
    }
}

func saveWinners(won round: Int, with draws: Set<Int>) {
//    let lastWinner = rollLotto()  >> 새로운 roll로 인식을 하는거구나
    /// 어디에 함수를 실행하도록 넣는지에 따라서 값이 바뀌거나 안 바뀐다.
    /// + 전역 변수로 두어야 해당 값이 바뀌지 않는다?

    previousWinners.updateValue(draws, forKey: round)
}

func findPreviousWinners(round: Int?) {
    guard let round = round, round > 0 else {
        print("0보다 큰 숫자를 작성해주세요.");
        return }
    
    if let unwrapWinner = previousWinners[round] {
        let winner = unwrapWinner.map{String($0)}.joined(separator: ", ")
        print("\(round)회차의 당첨 번호는 \(winner)입니다.")
    }
}

////MARK: - edge 도움
//
//class LottoNumberGenerator {
//    var previousNumber: [String] = []
//
//    func generateNumber() -> String {
//        var lottoNumber = ""
//
//        for _ in 1...6 {
//            let digit = Int.random(in: 1...45)
//            lottoNumber += String(digit)
//        }
//
//        previousNumber.append(lottoNumber)  // 이 친구는 여기에서 값을 넣도록 하네?
//        return lottoNumber
//    }
//
//    /// 이건 말이 안되는거 같아.
//    func previousWinners() {
//        print("Previous Winners:")
//        for number in previousNumber {
//            print(number)
//        }
//    }
//}
//
//
