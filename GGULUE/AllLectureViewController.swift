//
//  AllLectureViewController.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 8. 1..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit

class AllLectureViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    var data  = allLectureArray
    var filteredArray : [Lecture] = []
    
    @IBOutlet weak var allLectureTable: UITableView!
    @IBOutlet weak var allLectureSearchBar: UISearchBar!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllLectureCell", for: indexPath)
        cell.textLabel?.text = "\(filteredArray[indexPath.row].lec_name), \(filteredArray[indexPath.row].lec_prof) 교수"
        cell.detailTextLabel?.text = "\(round(filteredArray[indexPath.row].self_score*100)/100)"
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = allLectureTable.indexPathForSelectedRow, let LDVC = segue.destination as? LectureDetailViewController{
            let selectedLecture = filteredArray[indexPath.row]
            LDVC.selectedLecture = selectedLecture
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = searchText.isEmpty ? data : data.filter({(dataLecture:Lecture)->Bool in
            return dataLecture.lec_name.range(of : searchText, options: .caseInsensitive) != nil
            })
        allLectureTable.reloadData()
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.allLectureSearchBar.showsCancelButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.allLectureSearchBar.showsCancelButton = false
        self.allLectureSearchBar.text = ""
        self.allLectureSearchBar.resignFirstResponder()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search text: ", self.allLectureSearchBar.text!)
        
        let refreshAlert = UIAlertController(title: "검색결과", message: self.allLectureSearchBar.text!, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: {(action:UIAlertAction!) in
            print("검색확인")
            
            self.allLectureSearchBar.showsCancelButton = false
            self.allLectureSearchBar.text = ""
            self.allLectureSearchBar.resignFirstResponder()
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.allLectureSearchBar.delegate = self
        self.allLectureSearchBar.placeholder = "강의이름을 검색하세요"
        self.allLectureTable.dataSource = self
        self.allLectureTable.delegate = self
        self.filteredArray = self.data
        

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
