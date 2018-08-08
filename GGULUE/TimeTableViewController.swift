//
//  TimeTableViewController.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 7. 31..
//  Copyright © 2018년 GGULUE. All rights reserved.
//
import UIKit
class TimeTableViewController: UIViewController {
    var ColorArray : [UIColor] = [UIColor(red: 245/255, green: 197/255, blue: 202/255, alpha: 1), UIColor(red: 241/255, green: 169/255, blue: 187/255, alpha: 1), UIColor(red: 219/255, green: 134/255, blue: 169/255, alpha: 1), UIColor(red: 187/255, green: 217/255, blue: 200/255, alpha: 1), UIColor(red: 244/255, green: 218/255, blue: 201/255, alpha: 1), UIColor(red: 165/255, green: 103/255, blue: 178/255, alpha: 1), UIColor(red: 255/255, green: 230/255, blue: 105/255, alpha: 1), UIColor(red: 0, green: 160/255, blue: 178/255, alpha: 1),UIColor(red: 161/255, green: 255/255, blue: 143/255, alpha: 1)]
    
    
    @IBOutlet weak var titleMon: UIView!
    @IBOutlet weak var titleTue: UIView!
    @IBOutlet weak var titleWed: UIView!
    @IBOutlet weak var titleThu: UIView!
    @IBOutlet weak var titleFri: UIView!

    @IBOutlet weak var time1: UIView!
    @IBOutlet weak var time2: UIView!
    @IBOutlet weak var time3: UIView!
    @IBOutlet weak var time4: UIView!
    @IBOutlet weak var time5: UIView!
    @IBOutlet weak var time6: UIView!
    @IBOutlet weak var time7: UIView!
    @IBOutlet weak var time8: UIView!
    @IBOutlet weak var time9: UIView!
    

    
    
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

    @IBOutlet weak var mon1Title: UILabel!
    @IBOutlet weak var mon1Sub: UILabel!
    @IBOutlet weak var mon2Title: UILabel!
    @IBOutlet weak var mon2Sub: UILabel!
    @IBOutlet weak var mon3Title: UILabel!
    @IBOutlet weak var mon3Sub: UILabel!
    @IBOutlet weak var mon4Title: UILabel!
    @IBOutlet weak var mon4Sub: UILabel!
    @IBOutlet weak var mon5Title: UILabel!
    @IBOutlet weak var mon5Sub: UILabel!
    @IBOutlet weak var mon6Title: UILabel!
    @IBOutlet weak var mon6Sub: UILabel!
    @IBOutlet weak var mon7Title: UILabel!
    @IBOutlet weak var mon7Sub: UILabel!
    @IBOutlet weak var mon8Title: UILabel!
    @IBOutlet weak var mon8Sub: UILabel!
    @IBOutlet weak var mon9Title: UILabel!
    @IBOutlet weak var mon9Sub: UILabel!

    @IBOutlet weak var tue1Title: UILabel!
    @IBOutlet weak var tue1Sub: UILabel!
    @IBOutlet weak var tue2Title: UILabel!
    @IBOutlet weak var tue2Sub: UILabel!
    @IBOutlet weak var tue3Title: UILabel!
    @IBOutlet weak var tue3Sub: UILabel!
    @IBOutlet weak var tue4Title: UILabel!
    @IBOutlet weak var tue4Sub: UILabel!
    @IBOutlet weak var tue5Title: UILabel!
    @IBOutlet weak var tue5Sub: UILabel!
    @IBOutlet weak var tue6Title: UILabel!
    @IBOutlet weak var tue6Sub: UILabel!
    @IBOutlet weak var tue7Title: UILabel!
    @IBOutlet weak var tue7Sub: UILabel!
    @IBOutlet weak var tue8Title: UILabel!
    @IBOutlet weak var tue8Sub: UILabel!
    @IBOutlet weak var tue9Title: UILabel!
    @IBOutlet weak var tue9Sub: UILabel!

    @IBOutlet weak var wed1Title: UILabel!
    @IBOutlet weak var wed1Sub: UILabel!
    @IBOutlet weak var wed2Title: UILabel!
    @IBOutlet weak var wed2Sub: UILabel!
    @IBOutlet weak var wed3Title: UILabel!
    @IBOutlet weak var wed3Sub: UILabel!
    @IBOutlet weak var wed4Title: UILabel!
    @IBOutlet weak var wed4Sub: UILabel!
    @IBOutlet weak var wed5Title: UILabel!
    @IBOutlet weak var wed5Sub: UILabel!
    @IBOutlet weak var wed6Title: UILabel!
    @IBOutlet weak var wed6Sub: UILabel!
    @IBOutlet weak var wed7Title: UILabel!
    @IBOutlet weak var wed7Sub: UILabel!
    @IBOutlet weak var wed8Title: UILabel!
    @IBOutlet weak var wed8Sub: UILabel!
    @IBOutlet weak var wed9Title: UILabel!
    @IBOutlet weak var wed9Sub: UILabel!

    @IBOutlet weak var thu1Title: UILabel!
    @IBOutlet weak var thu1Sub: UILabel!
    @IBOutlet weak var thu2Title: UILabel!
    @IBOutlet weak var thu2Sub: UILabel!
    @IBOutlet weak var thu3Title: UILabel!
    @IBOutlet weak var thu3Sub: UILabel!
    @IBOutlet weak var thu4Title: UILabel!
    @IBOutlet weak var thu4Sub: UILabel!
    @IBOutlet weak var thu5Title: UILabel!
    @IBOutlet weak var thu5Sub: UILabel!
    @IBOutlet weak var thu6Title: UILabel!
    @IBOutlet weak var thu6Sub: UILabel!
    @IBOutlet weak var thu7Title: UILabel!
    @IBOutlet weak var thu7Sub: UILabel!
    @IBOutlet weak var thu8Title: UILabel!
    @IBOutlet weak var thu8Sub: UILabel!
    @IBOutlet weak var thu9Title: UILabel!
    @IBOutlet weak var thu9Sub: UILabel!

    @IBOutlet weak var fri1Title: UILabel!
    @IBOutlet weak var fri1Sub: UILabel!
    @IBOutlet weak var fri2Title: UILabel!
    @IBOutlet weak var fri2Sub: UILabel!
    @IBOutlet weak var fri3Title: UILabel!
    @IBOutlet weak var fri3Sub: UILabel!
    @IBOutlet weak var fri4Title: UILabel!
    @IBOutlet weak var fri4Sub: UILabel!
    @IBOutlet weak var fri5Title: UILabel!
    @IBOutlet weak var fri5Sub: UILabel!
    @IBOutlet weak var fri6Title: UILabel!
    @IBOutlet weak var fri6Sub: UILabel!
    @IBOutlet weak var fri7Title: UILabel!
    @IBOutlet weak var fri7Sub: UILabel!
    @IBOutlet weak var fri8Title: UILabel!
    @IBOutlet weak var fri8Sub: UILabel!
    @IBOutlet weak var fri9Title: UILabel!
    @IBOutlet weak var fri9Sub: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        let viewArray:[[UIView]] = [
            [mon1, mon2, mon3, mon4, mon5, mon6, mon7, mon8, mon9],
            [tue1, tue2, tue3, tue4, tue5, tue6, tue7, tue8, tue9],
            [wed1, wed2, wed3, wed4, wed5, wed6, wed7, wed8, wed9],
            [thu1, thu2, thu3, thu4, thu5, thu6, thu7, thu8, thu9],
            [fri1, fri2, fri3, fri4, fri5, fri6, fri7, fri8, fri9]
        ]
        let defaultViewArray : [UIView] =  [titleMon, titleTue, titleWed, titleThu, titleFri, time1, time2, time3, time4, time5, time6, time7, time8, time9]
        let titleLabelArray : [[UILabel]] = [
            [mon1Title, mon2Title, mon3Title, mon4Title, mon5Title, mon6Title, mon7Title, mon8Title, mon9Title],
            [tue1Title, tue2Title, tue3Title, tue4Title, tue5Title, tue6Title, tue7Title, tue8Title, tue9Title],
            [wed1Title, wed2Title, wed3Title, wed4Title, wed5Title, wed6Title, wed7Title, wed8Title, wed9Title],
            [thu1Title, thu2Title, thu3Title, thu4Title, thu5Title, thu6Title, thu7Title, thu8Title, thu9Title],
            [fri1Title, fri2Title, fri3Title, fri4Title, fri5Title, fri6Title, fri7Title, fri8Title, fri9Title]
        ]
        let subLabelArray : [[UILabel]] = [
            [mon1Sub, mon2Sub, mon3Sub, mon4Sub, mon5Sub, mon6Sub, mon7Sub, mon8Sub, mon9Sub],
            [tue1Sub, tue2Sub, tue3Sub, tue4Sub, tue5Sub, tue6Sub, tue7Sub, tue8Sub, tue9Sub],
            [wed1Sub, wed2Sub, wed3Sub, wed4Sub, wed5Sub, wed6Sub, wed7Sub, wed8Sub, wed9Sub],
            [thu1Sub, thu2Sub, thu3Sub, thu4Sub, thu5Sub, thu6Sub, thu7Sub, thu8Sub, thu9Sub],
            [fri1Sub, fri2Sub, fri3Sub, fri4Sub, fri5Sub, fri6Sub, fri7Sub, fri8Sub, fri9Sub]
        ]
        for item in 0..<5{
            for item2 in 0..<9{
                titleLabelArray[item][item2].text = ""
                subLabelArray[item][item2].text = ""
            }
        }
        for item in defaultViewArray{
            item.layer.borderWidth = 1
            item.layer.borderColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1).cgColor
        }
        for item in viewArray{
            for item2 in item{
                item2.backgroundColor = UIColor.white
                item2.layer.borderWidth = 1
                item2.layer.borderColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1).cgColor
            }
        }
        var countValue = 0
        for i in 0..<timeTableLectureArray.count{
            let newArray = convertTimeInfo(timeTableLectureArray[i].lec_time as! [String])
            for item in newArray{
                let yoil : Int = item/10-1
                let gyosi : Int = item%10-1
                var valueBool : Bool = true
                if viewArray[yoil][gyosi].backgroundColor == UIColor.white {
                    for j in newArray{
                        if item-1 == j{
                            valueBool = false
                        }
                    }
                    if valueBool {
                        if titleLabelArray[yoil][gyosi].text == ""{
                            titleLabelArray[yoil][gyosi].text = timeTableLectureArray[i].lec_name
                            subLabelArray[yoil][gyosi].text = timeTableLectureArray[i].lec_location
                        }
                    }
                }else{
                    titleLabelArray[yoil][gyosi].text = "강의중복"
                    subLabelArray[yoil][gyosi].text = ""
                }
                viewArray[yoil][gyosi].backgroundColor = ColorArray[countValue]
                viewArray[yoil][gyosi].layer.borderWidth = 0
            }
            countValue += 1
            if countValue > ColorArray.count-1{
                countValue = ColorArray.count - 1
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
