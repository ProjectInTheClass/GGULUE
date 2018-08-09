//
//  FavoriteListViewController.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 7. 31..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit

class FavoriteListViewController: UIViewController, UITableViewDataSource, ChangeLectureTimeTable, UITableViewDelegate {
    func changeLecture(_ sender: UITableViewCell, _ boolValue:Bool) {
        let indexPath = favoriteLecutureTable.indexPath(for: sender)
        if boolValue{
            timeTableLectureArray.append(favoriteLectureArray[(indexPath?.row)!])
            confirmLectureArray2.append(favoriteLectureArray[(indexPath?.row)!].lec_name!)
        }else{
            var valueBool : Bool = false
            var intValue : Int = -1
            for i in 0..<confirmLectureArray2.count{
                if confirmLectureArray2[i] == favoriteLectureArray[(indexPath?.row)!].lec_name{
                    valueBool = true
                    intValue = i
                }
            }
            if valueBool{
                timeTableLectureArray.remove(at: intValue)
                confirmLectureArray2.remove(at: intValue)
            }
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        var deleteTimeTableBool : Bool = false
        var intValue = -1
        for i in 0..<confirmLectureArray2.count{
            if confirmLectureArray2[i] == favoriteLectureArray[indexPath.row].lec_name{
                deleteTimeTableBool = true
                intValue = i
            }
        }
        if deleteTimeTableBool{
            timeTableLectureArray.remove(at: intValue)
            confirmLectureArray2.remove(at: intValue)
        }
        favoriteLectureArray.remove(at: indexPath.row)
        confirmLectureArray.remove(at: indexPath.row)
        favoriteLecutureTable.deleteRows(at: [indexPath], with: .automatic)
        
    }
    
    @IBOutlet weak var favoriteLecutureTable: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteLectureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteLectureCell", for: indexPath) as! FavoriteTableViewCell
        cell.customTextLabel.text = "\(favoriteLectureArray[indexPath.row].lec_name!), \(favoriteLectureArray[indexPath.row].lec_prof!) 교수"
        cell.delegate = self

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        favoriteLecutureTable.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        favoriteLecutureTable.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = favoriteLecutureTable.indexPathForSelectedRow, let LDVC = segue.destination as? LectureDetailViewController{
            let selectedLecture = favoriteLectureArray[indexPath.row]
            LDVC.selectedLecture = selectedLecture
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
