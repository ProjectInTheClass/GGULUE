//
//  FavoriteListViewController.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 7. 31..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit

class FavoriteListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var favoriteLecutureTable: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteLectureArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteLectureCell", for: indexPath)
        
        cell.textLabel?.text = favoriteLectureArray[indexPath.row].lec_name
        cell.detailTextLabel?.text = "\(favoriteLectureArray[indexPath.row].self_score)"
        
        return cell
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
        favoriteLecutureTable.reloadData()
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
