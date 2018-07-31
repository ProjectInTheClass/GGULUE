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
    
    @IBAction func addLecture(_ sender: Any) {
        let valueString = selectedLecture?.lec_name
        var valueBool : Bool = false
        for item in confirmLectureArray{
            if valueString == item{
                valueBool = true
            }
        }
        if valueBool{
            print("이미 강의를 추가하셨습니다.")
        }else{
            favoriteLectureArray.append(selectedLecture!)
            confirmLectureArray.append((selectedLecture?.lec_name)!)
        }
    }
    @IBAction func removeLecture(_ sender: Any) {
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
            favoriteLectureArray.remove(at: valueInt)
            confirmLectureArray.remove(at: valueInt)
        }else{
            print("강의목록에 없는 강의입니다.")
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        lec_nameLabel.text = selectedLecture?.lec_name
        lec_profLabel.text = selectedLecture?.lec_prof
        lec_locationLabel.text = selectedLecture?.lec_location
        lec_timeLabel.text = selectedLecture?.lec_time
        lec_scoreLabel.text = "\(selectedLecture?.self_score ?? 0)점"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
