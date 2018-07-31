//
//  TimeTableViewController.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 7. 31..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit

class TimeTableViewController: UIViewController {
    
    @IBOutlet weak var mon1: UIView!
    @IBOutlet weak var mon2: UIView!
    @IBOutlet weak var mon3: UIView!
    @IBOutlet weak var mon4: UIView!
    @IBOutlet weak var mon5: UIView!
    @IBOutlet weak var mon6: UIView!
    @IBOutlet weak var mon7: UIView!
    @IBOutlet weak var mon8: UIView!
    @IBOutlet weak var mon9: UIView!
    
    @IBOutlet weak var tue1: UIView!
    @IBOutlet weak var tue2: UIView!
    @IBOutlet weak var tue3: UIView!
    @IBOutlet weak var tue4: UIView!
    @IBOutlet weak var tue5: UIView!
    @IBOutlet weak var tue6: UIView!
    @IBOutlet weak var tue7: UIView!
    @IBOutlet weak var tue8: UIView!
    @IBOutlet weak var tue9: UIView!
    
    @IBOutlet weak var wed1: UIView!
    @IBOutlet weak var wed2: UIView!
    @IBOutlet weak var wed3: UIView!
    @IBOutlet weak var wed4: UIView!
    @IBOutlet weak var wed5: UIView!
    @IBOutlet weak var wed6: UIView!
    @IBOutlet weak var wed7: UIView!
    @IBOutlet weak var wed8: UIView!
    @IBOutlet weak var wed9: UIView!
    
    @IBOutlet weak var thu1: UIView!
    @IBOutlet weak var thu2: UIView!
    @IBOutlet weak var thu3: UIView!
    @IBOutlet weak var thu4: UIView!
    @IBOutlet weak var thu5: UIView!
    @IBOutlet weak var thu6: UIView!
    @IBOutlet weak var thu7: UIView!
    @IBOutlet weak var thu8: UIView!
    @IBOutlet weak var thu9: UIView!
    
    @IBOutlet weak var fri1: UIView!
    @IBOutlet weak var fri2: UIView!
    @IBOutlet weak var fri3: UIView!
    @IBOutlet weak var fri4: UIView!
    @IBOutlet weak var fri5: UIView!
    @IBOutlet weak var fri6: UIView!
    @IBOutlet weak var fri7: UIView!
    @IBOutlet weak var fri8: UIView!
    @IBOutlet weak var fri9: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        let viewArray:[UIView] = [mon1, mon2, mon3, mon4, mon5, mon6, mon7, mon8, mon9, tue1, tue2, tue3, tue4, tue5, tue6, tue7, tue8, tue9, wed1, wed2, wed3, wed4, wed5, wed6, wed7, wed8, wed9, thu1, thu2, thu3, thu4, thu5, thu6, thu7, thu8, thu9, fri1, fri2, fri3, fri4, fri5, fri6, fri7, fri8, fri9]
        for item in viewArray{
            item.backgroundColor = UIColor.white
        }
        for i in 0..<favoriteLectureArray.count{
            if favoriteLectureArray[i].lec_time == "월(1) 수(1)"{
                mon1.backgroundColor = UIColor.red
                wed1.backgroundColor = UIColor.red
            }else if favoriteLectureArray[i].lec_time == "월(2) 수(2)"{
                mon2.backgroundColor = UIColor.blue
                wed2.backgroundColor = UIColor.blue
            }else if favoriteLectureArray[i].lec_time == "월(5) 수(5)"{
                mon5.backgroundColor = UIColor.brown
                wed5.backgroundColor = UIColor.brown
            }else if favoriteLectureArray[i].lec_time == "화(1) 목(1)"{
                tue1.backgroundColor = UIColor.black
                thu1.backgroundColor = UIColor.black
            }else if favoriteLectureArray[i].lec_time == "화(2) 목(2)"{
                tue2.backgroundColor = UIColor.orange
                thu2.backgroundColor = UIColor.orange
            }else if favoriteLectureArray[i].lec_time == "화(5) 목(5)"{
                tue5.backgroundColor = UIColor.yellow
                thu5.backgroundColor = UIColor.yellow
            }else if favoriteLectureArray[i].lec_time == "금(1-3)"{
                fri1.backgroundColor = UIColor.purple
                fri2.backgroundColor = UIColor.purple
                fri3.backgroundColor = UIColor.purple
            }
        }
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
