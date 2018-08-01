//
//  ValueManager.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 7. 26..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import Foundation
//강의 구조체
struct Lecture {
    let star_score: Double
    var attendance_score: Double
    var grade_score: Double
    var level_score: Double
    var amount_score: Double
    var achi_score: Double
    var self_score: Double
    
    let lec_name: String
    let lec_prof: String
    let lec_location: String
    let lec_time: String
    //let lec_lectureNumber : String
    //let lec_class:String
    
    
    
    //알고리즘에 따라 점수계산
    mutating func cal_total(_ b:CalculatorStandard) -> Lecture{
        var result : Double = 0
        var temp: Double = 0
        temp = b.r_attendence+b.r_grade+b.r_level+b.r_amount+b.r_achi
        if temp == 1{
            result = (self.attendance_score*b.r_attendence)+(self.grade_score*b.r_grade)+(self.level_score*b.r_level)+(self.amount_score*b.r_amount)+(self.achi_score*b.r_achi)
            self.self_score = result
        }
        return self
    }
}


//알고리즘 계산
class CalculatorStandard{
    var r_attendence : Double
    var r_grade : Double
    var r_level : Double
    var r_amount : Double
    var r_achi: Double
    init(_ attendence:Double, _ grade:Double, _ level:Double, _ amount:Double, _ achi:Double){
        self.r_attendence = attendence
        self.r_grade = grade
        self.r_level = level
        self.r_amount = amount
        self.r_achi = achi
    }
}


//merge sort
func mergeSort(_ array: [Lecture], _ direction : String) -> [Lecture] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]), direction)
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]), direction)
    
    return merge(leftArray, rightArray, direction)
}
func merge(_ left: [Lecture], _ right: [Lecture], _ direction : String) -> [Lecture] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Lecture] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if direction == "DOWN"{
            if leftElement.self_score > rightElement.self_score {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement.self_score < rightElement.self_score {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }else{
            if leftElement.self_score < rightElement.self_score {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement.self_score > rightElement.self_score {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}



//강의 배열을 사용자 정의 알고리즘에 따라 값을 수정하는 함수
func re_calculate(_ arry : [Lecture], _ cal : CalculatorStandard) -> [Lecture]{
    var newArray: [Lecture] = []
    for i in 0..<arry.count{
        var temp = arry[i]
        newArray.append(temp.cal_total(cal))
    }
    return newArray
}


//사용자 정의 알고리즘
var self_cal = CalculatorStandard(0.2, 0.2, 0.2, 0.2, 0.2)


//강의
var lec_1 = Lecture(star_score: 2.56, attendance_score: 4.1, grade_score: 2.9, level_score: 3.3, amount_score: 3.2, achi_score: 2.8, self_score: 2.56, lec_name: "재료구조물성", lec_prof: "서지훈", lec_location: "창의관114호", lec_time: "화(2) 목(2)")
var lec_2 = Lecture(star_score: 2.44, attendance_score: 3, grade_score: 2.6, level_score: 3.8, amount_score: 3.5, achi_score: 2.6, self_score: 2.44, lec_name: "물리화학", lec_prof: "강윤찬", lec_location: "신공학관102호", lec_time: "월(2) 수(2)")
var lec_3 = Lecture(star_score: 3.42, attendance_score: 3, grade_score: 3.7, level_score: 3.2, amount_score: 4, achi_score: 2.8, self_score: 3.42, lec_name: "세라믹재료개론", lec_prof: "임대순", lec_location: "창의관203호", lec_time: "월(1) 수(1)")
var lec_4 = Lecture(star_score: 2.36, attendance_score: 2.2, grade_score: 3.5, level_score: 3.5, amount_score: 2.3, achi_score: 3.5, self_score: 2.36, lec_name: "생활속의신소재공학", lec_prof: "이종흔", lec_location: "창의관B114호", lec_time: "월(5) 수(5)")
var lec_5 = Lecture(star_score: 3, attendance_score: 2.3, grade_score: 3.5, level_score: 3.5, amount_score: 3, achi_score: 2.8, self_score: 3, lec_name: "공업수학", lec_prof: "남산", lec_location: "창의관116호", lec_time: "화(5) 목(5)")
var lec_6 = Lecture(star_score: 2.69, attendance_score: 2.5, grade_score: 4, level_score: 2, amount_score: 3, achi_score: 2.5, self_score: 2.69, lec_name: "컴퓨터언어및실습", lec_prof: "김종훈", lec_location: "하나과학관B125호", lec_time: "금(1-3)")


//강의를 저장할 배열
var lectureArray : [Lecture] = [lec_1, lec_2, lec_3, lec_4, lec_5, lec_6]
var allLectureArray : [Lecture] = [lec_1, lec_2, lec_3, lec_4, lec_5, lec_6]

var dayOfWeek = ["월" : 1, "화" : 2, "수" : 3, "목" : 4, "금" : 5]
var tableLectureArray : [Lecture] = []
var favoriteLectureArray : [Lecture] = []
var confirmLectureArray : [String] = []
var rateList : [Float] = [0.2, 0.2, 0.2, 0.2, 0.2]
var realList : [Float] = [1, 1, 1, 1, 1]

