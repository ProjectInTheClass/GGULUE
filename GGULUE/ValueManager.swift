//
//  ValueManager.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 7. 26..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import Foundation
let infoTime = "[월화수목금토][(][\\s\\S]+?[)]"
struct Lecture {
    var IdNumber : String?
    var attend_limit : String?
    var attnd_free : String?
    var exchange : String?
    var flex : String?
    var flip : String?
    var hakjeom : String?
    var lec_name : String?
    var mooc : String?
    var lec_prof : String?
    var relative_assessmnet : String?
    var supervise : String?
    var wait : String?
    var lec_time : [String?]
    var lec_location : String?
    var fivescore :[[Double?]]
    var star_score : Double?
    var self_score : Double
    
    //알고리즘에 따라 점수계산
    mutating func cal_total(_ b:CalculatorStandard) -> Lecture{
        var tempArray : [Double] = []
        var temp2 : Double = 0
        for i in self.fivescore{
            if i[0] != -1{
                var result : Double = 0
                result += (i[0]!*b.r_attendence)
                result += (i[1]!*b.r_level)
                result += (i[2]!*b.r_amount)
                result += (i[3]!*b.r_grade)
                result += (i[4]!*b.r_achi)
                tempArray.append(result)
            }
        }
        for j in tempArray{
            temp2 += j
        }
        if tempArray.count != 0{
            temp2 = temp2/Double(tempArray.count)
        }else{
            temp2 = -1
        }
        self.self_score = temp2
        return self
    }
}
struct KlueData {
    var IdNumber : String?
    var fivescore : [Double]
    var lecname : String?
    var prof : String?
    var starscore : Double?
}

//시간+장소정보에서 시간정보 빼오기
func matches(for regex: String, in text: String) -> [String] {
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let nsString = text as NSString
        let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
        return results.map { nsString.substring(with: $0.range)}
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}
func location(_ text : String, _ list : [String]) -> String{
    var newText = Array(text)
    var newCharArray : [Character] = []
    if list.count != 0{
        var newItem = Array(list[0])
        for i in 0..<newText.count{
            if newText[i] == newItem[0] && newText[i+1] == newItem[1] && newText[i+2] == newItem[2] && newText[i+3] == newItem[3]{
                for _ in 0..<newItem.count{
                    newText.remove(at: i)
                }
                break
            }
        }
        if list.count >= 2 {
            newItem = Array(list[1])
            for i in 0..<newText.count{
                if newText[i] == newItem[0] && newText[i+1] == newItem[1] && newText[i+2] == newItem[2] && newText[i+3] == newItem[3]{
                    break
                }else{
                    newCharArray.append(newText[i])
                }
            }
        }else{
            newCharArray = newText
        }
        if newCharArray.count > 0{
            if newCharArray[0] == " "{
                newCharArray.remove(at: 0)
            }
        }
        let newString = String(newCharArray)
        return newString
    }else{
        return "강의정보가 없습니다."
    }
}


func makeKlueData(_ data : [String : Any]) -> [KlueData]{
    var newKlueData : [KlueData] = []
    for (key, value) in data{
        let name = key
        let newName = name.components(separatedBy: "_")[0]
        var detail = value as! [String:String]
        let newScoreArray = detail["fivescore"]?.trimmingCharacters(in: ["[", "]", "'"]).components(separatedBy: ",").map{$0.trimmingCharacters(in: [" ", "'"])}
        var newScoreArray2 : [Double] = []
        for i in newScoreArray!{
            if let value2 = Double(i){
                newScoreArray2.append(value2)
            }else{
                newScoreArray2.append(-1)
            }
        }
        let newStringValue : String = (detail["starscore"]?.trimmingCharacters(in: ["★"]).trimmingCharacters(in: [" "]))!
        var value4 : Double = -1
        if let value3 = Double(newStringValue){
            value4 = value3
        }
        newKlueData.append(KlueData(IdNumber : newName, fivescore: newScoreArray2, lecname: detail["lecname"], prof: detail["prof"], starscore: value4))
    }
    return newKlueData
}

func makeLecture(_ data : [String : Any], _ scoreData : [KlueData]) -> [Lecture] {
    var newLecture : [Lecture] = []
    for (key, value) in data{
        var newArray : [[Double]] = []
        var detail = value as! [String:String]
        var starscore : Double = -1
        for item in scoreData{
            if item.IdNumber == key.components(separatedBy: "-")[0] && item.prof == detail["prof"] {
                newArray.append(item.fivescore)
                starscore = item.starscore!
            }
        }
        let newString = detail["whenwhere"]!
        let time : [String] = matches(for: infoTime, in: newString)
        let local = location(newString, time)
        newLecture.append(Lecture(IdNumber: key, attend_limit: detail["attend_limit"], attnd_free: detail["attnd_free"], exchange: detail["exchange"], flex: detail["flex"], flip: detail["flip"], hakjeom: detail["hakjeom"], lec_name: detail["lec"], mooc: detail["mooc"], lec_prof: detail["prof"], relative_assessmnet: detail["relative_assessmnet"], supervise: detail["supervise"], wait: detail["wait"], lec_time: time, lec_location: local, fivescore : newArray, star_score: starscore, self_score: starscore))
        
    }
    return newLecture
}



let filePath = "/Users/eujeongsmacbookpro/GGULUE/ggulue-d3d2c-gyoyang-export.json"
let filePath2 = "/Users/eujeongsmacbookpro/GGULUE/ggulue-d3d2c-klue-export.json"
let data2 = try! String(contentsOfFile: filePath2).data(using: .utf8)
let kluedata = try! JSONSerialization.jsonObject(with: data2!, options: []) as! [String:Any]
let kluedataArray = makeKlueData(kluedata)

let data = try! String(contentsOfFile: filePath).data(using: .utf8)
let lecturedata = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String : Any]
let lectureDataArray = makeLecture(lecturedata, kluedataArray)




//알고리즘 계산
class CalculatorStandard{
    var r_attendence : Double
    var r_level : Double
    var r_amount : Double
    var r_grade : Double
    var r_achi: Double
    init(_ attendence:Double, _ level:Double, _ amount:Double, _ grade:Double, _ achi:Double){
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
var lec_1 = Lecture(IdNumber: "", attend_limit: "", attnd_free:  "", exchange:  "", flex:  "", flip:  "", hakjeom:  "", lec_name: "재료구조물성", mooc:  "", lec_prof: "서지훈", relative_assessmnet:  "", supervise: "", wait: "", lec_time: ["화(2)", "목(2)"], lec_location: "창의관114호", fivescore : [], star_score: 2.56, self_score: 2.56)
var lec_2 = Lecture(IdNumber: "", attend_limit:  "", attnd_free:  "", exchange:  "", flex:  "", flip:  "", hakjeom:  "", lec_name: "물리화학", mooc:  "", lec_prof: "강윤찬", relative_assessmnet: "", supervise:  "", wait: "", lec_time: ["월(2)", "수(2)"], lec_location: "신공학관102호", fivescore : [[3, 2.6, 3.8, 3.5, 2.6]], star_score: 2.44, self_score: 2.44)
var lec_3 = Lecture(IdNumber: "", attend_limit:  "", attnd_free:  "", exchange:  "", flex:  "", flip:  "", hakjeom:  "", lec_name: "세라믹재료개론", mooc:  "", lec_prof: "임대순", relative_assessmnet:  "", supervise: "", wait: "", lec_time: ["월(1)", "수(1)"], lec_location: "창의관203호", fivescore : [[3, 3.7, 3.2, 4, 2.8]], star_score: 3.42, self_score: 3.42)
var lec_4 = Lecture(IdNumber: "", attend_limit: "", attnd_free: "", exchange: "", flex: "", flip: "", hakjeom: "", lec_name: "생활속의신소재공학", mooc: "", lec_prof: "이종흔", relative_assessmnet: "", supervise: "", wait: "", lec_time: ["월(5)", "수(5)"], lec_location: "창의관B114호", fivescore : [[2.2, 3.5, 3.5, 2.3, 3.5]], star_score: 2.36, self_score: 2.36)
var lec_5 = Lecture(IdNumber: "", attend_limit: "", attnd_free: "", exchange: "", flex: "", flip: "", hakjeom: "", lec_name: "공업수학", mooc: "", lec_prof: "남산", relative_assessmnet: "", supervise: "", wait: "", lec_time: ["화(5)", "목(5)"], lec_location: "창의관116호", fivescore : [[2.3, 3.5, 3.5, 3, 2.8]], star_score: 3, self_score: 3)
var lec_6 = Lecture(IdNumber: "", attend_limit: "", attnd_free: "", exchange: "", flex: "", flip: "", hakjeom: "", lec_name: "컴퓨터언어및실습", mooc: "", lec_prof: "김종훈", relative_assessmnet: "", supervise: "", wait: "", lec_time: ["금(1-3)"], lec_location: "하나과학관B125호", fivescore : [[2.5, 4, 2, 3, 2.5]], star_score: 2.69, self_score: 2.69)


//강의를 저장할 배열
var lectureArray : [Lecture] = [lec_1, lec_2, lec_3, lec_4, lec_5, lec_6]
var allLectureArray : [Lecture] = lectureDataArray

var tableLectureArray : [Lecture] = []
var favoriteLectureArray : [Lecture] = []
var confirmLectureArray : [String] = []      //compare with favoriteLectureArray
var timeTableLectureArray : [Lecture] = []
var confirmLectureArray2 : [String] = []    //compare with timeTableLectureArray
var rateList : [Float] = [0.2, 0.2, 0.2, 0.2, 0.2]
var realList : [Float] = [0.215, 0.81, 0.215, 0.215, 0.81]




//string타입의 시간정보를 int타입으로 변경
func convertTimeInfo(_ timeList:[String]) -> [Int]{
    var newArray : [Int] = []
    var timeArray : [[String]] = []
    for i in 0..<timeList.count{
        timeArray.append(timeList[i].components(separatedBy: "(").map{$0.trimmingCharacters(in: [")"])})
    }
    for i in 0..<timeArray.count{
        var timeInfo = 0
        switch timeArray[i][0]{
        case "월":
            timeInfo += 10
        case "화":
            timeInfo += 20
        case "수":
            timeInfo += 30
        case "목":
            timeInfo += 40
        case "금":
            timeInfo += 50
        default:
            timeInfo = 0
        }
        if let intValue = Int(timeArray[i][1]){
            timeInfo += intValue
            newArray.append(timeInfo)
        }else{
            var tempArray : [String]
            tempArray = timeArray[i][1].components(separatedBy: "-")
            var tempArray2 : [Int] = []
            for i in Int(tempArray[0])!..<(Int(tempArray[1])!+1){
                let timeInfo2 = timeInfo + i
                tempArray2.append(timeInfo2)
            }
            for item in tempArray2{
                newArray.append(item)
            }
        }
    }
    return newArray
}


