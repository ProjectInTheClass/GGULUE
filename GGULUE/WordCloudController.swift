//
//  WordCloudController.swift
//  GGULUE
//
//  Created by Eujeong's MacBook Pro on 2018. 8. 13..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit
var imageCount: Int = 0
class WordCloudController: UIViewController {
    let wordCloudArray:[UIImage] = [#imageLiteral(resourceName: "wd01"), #imageLiteral(resourceName: "wd02"), #imageLiteral(resourceName: "wd03"), #imageLiteral(resourceName: "wd04"), #imageLiteral(resourceName: "wd05"), #imageLiteral(resourceName: "wd06"), #imageLiteral(resourceName: "wd07"), #imageLiteral(resourceName: "wd08"), #imageLiteral(resourceName: "wd09"), #imageLiteral(resourceName: "wd10")]
    
    @IBOutlet weak var inputImage: UIImageView!
    
    
    var selectedLecture : Lecture?
    override func viewDidLoad() {
        super.viewDidLoad()
        inputImage.image = wordCloudArray[imageCount]
        if imageCount < 9{
            imageCount += 1
        }else{
            imageCount = 0
        }
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
