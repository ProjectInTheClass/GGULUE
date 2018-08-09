//
//  LectureDetailViewController.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 7. 26..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit

class LectureDetailViewController: UIViewController {

    var selectedLecture : Lecture?

    @IBOutlet weak var lec_nameLabel: UILabel!
    @IBOutlet weak var lec_profLabel: UILabel!
    @IBOutlet weak var lec_locationLabel: UILabel!
    @IBOutlet weak var lec_timeLabel: UILabel!
    @IBOutlet weak var lec_scoreLabel: UILabel!
    
    @IBOutlet weak var btn_addLecture: UIButton!
    @IBAction func handleAdd(_ sender: Any) {
        let valueString = selectedLecture?.lec_name
        var valueBool : Bool = false
        var valueInt : Int = -1
        for i in 0..<confirmLectureArray.count{
            if valueString == confirmLectureArray[i]{
                valueBool = true
                valueInt = i
            }
        }
        if valueBool{
            var deleteTimeTableBool : Bool = false
            var intValue = -1
            for i in 0..<confirmLectureArray2.count{
                if confirmLectureArray2[i] == selectedLecture?.lec_name{
                    deleteTimeTableBool = true
                    intValue = i
                }
            }
            if deleteTimeTableBool{
                timeTableLectureArray.remove(at: intValue)
                confirmLectureArray2.remove(at: intValue)
            }
            favoriteLectureArray.remove(at: valueInt)
            confirmLectureArray.remove(at: valueInt)
            btn_addLecture.isSelected = false
        }else{
            favoriteLectureArray.append(selectedLecture!)
            confirmLectureArray.append((selectedLecture?.lec_name)!)
            btn_addLecture.isSelected = true
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        lec_nameLabel.text = selectedLecture?.lec_name
        lec_profLabel.text = selectedLecture?.lec_prof
        lec_locationLabel.text = selectedLecture?.lec_location
        if selectedLecture?.lec_time.count == 0{
            lec_timeLabel.text = "강의시간 정보가 없습니다."
        }else{
            var tempString = ""
            for i in (selectedLecture?.lec_time)!{
                tempString += "\(i!) "
            }
            lec_timeLabel.text = tempString
        }
        if selectedLecture?.self_score == -1{
            lec_scoreLabel.text = "강의평가 정보가 없습니다."
        }else{
            lec_scoreLabel.text = "\(selectedLecture?.self_score ?? 0)점"
            
        }
        let valueString = selectedLecture?.lec_name
        var valueBool : Bool = false
        for item in confirmLectureArray{
            if valueString == item{
                valueBool = true
            }
        }
        if valueBool{
            btn_addLecture.isSelected = true
            
        }else{
            btn_addLecture.isSelected = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let chartVC = self.childViewControllers[0] as! RadarChartViewController
        chartVC.selectedLecture = selectedLecture
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
