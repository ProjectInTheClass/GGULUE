//
//  LectureListViewController.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 7. 26..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit
var goodBad : Int = 0
class LectureListViewController: UIViewController, UITableViewDataSource {
    //배열을 재계산후 정렬
    @IBOutlet weak var goodLectureButton: UIButton!
    @IBOutlet weak var badLectureButton: UIButton!
    @IBAction func changeGood(_ sender: Any) {
        tableLectureArray = mergeSort(re_calculate(lectureArray, self_cal), "DOWN")
        lectureTable.reloadData()
        goodBad = 0
    }
    @IBAction func changeBad(_ sender: Any) {
        tableLectureArray = mergeSort(re_calculate(lectureArray, self_cal), "UP")
        lectureTable.reloadData()
        goodBad = 1
    }

    @IBOutlet weak var lectureTable: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableLectureArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LectureCell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row+1) 위   \(tableLectureArray[indexPath.row].lec_name!), \(tableLectureArray[indexPath.row].lec_prof!) 교수"
        cell.detailTextLabel?.text = "\(round(tableLectureArray[indexPath.row].self_score*100)/100)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = lectureTable.indexPathForSelectedRow, let LDVC = segue.destination as? LectureDetailViewController{
            let selectedLecture = tableLectureArray[indexPath.row]
            LDVC.selectedLecture = selectedLecture
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch goodBad {
        case 0:
            tableLectureArray = mergeSort(re_calculate(lectureArray, self_cal), "DOWN")
        default:
            tableLectureArray = mergeSort(re_calculate(lectureArray, self_cal), "UP")
        }
        lectureTable.reloadData()
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
