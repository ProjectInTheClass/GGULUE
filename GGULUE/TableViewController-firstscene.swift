//
//  MeetingRoomListViewController.swift
//  MeetingRooms
//
//  Created by Jaehoon Lee on 2018. 7. 24..
//  Copyright © 2018년 SwiftHelloWorld. All rights reserved.
//

import UIKit

struct MyModel {
    var star_score: Double
    var attendance_score: Double
    var grade_score: Double
    var level_score: Double
    var amount_score: Double
    var achi_score: Double
    
    var lec_index: String
    var lec_prof: String
    var lec_location: String
    var lec_time: String

   // var basic_weighted_sum /// empty array
    // array 에 각 데이터 추가 후 총점 기준으로 sort
    
}

class MeetingRoomListViewController: UITableViewController {
    var data: [MyModel] = [
        MyModel(star_score: 3.6, attendance_score: 4.2, grade_score: 3.5, level_score: 2.7, amount_score: 4.2, achi_score: 2.9, lec_index: "Lecture001", lec_prof: "608", lec_location: "800", lec_time: "520"),
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        let item: MyModel = data[indexPath.row]
        cell.textLabel?.text = item.lec_index
        cell.detailTextLabel?.text = String(item.amount_score) + String(item.achi_score) + String(item.attendance_score) + String(item.grade_score)
        
        
            return cell
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */


