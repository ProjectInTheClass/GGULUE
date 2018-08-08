//
//  algorithmViewController.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 7. 31..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit

class algorithmViewController: UIViewController {
    

    func calRate(_ array:[Float]) -> [Float]{
        var valueFloat:Float = 0
        var valueArray:[Float] = []
        valueFloat = array.reduce(0, {$0+$1})
        valueArray = array.map({$0/valueFloat})
        return valueArray
    }
    func changeAlgorithm(_ cal:CalculatorStandard,_ array:[Float]) -> CalculatorStandard{
        cal.r_attendence = Double(array[0])
        cal.r_grade = Double(array[1])
        cal.r_level = Double(array[2])
        cal.r_amount = Double(array[3])
        cal.r_achi = Double(array[4])
        return CalculatorStandard(cal.r_attendence, cal.r_grade, cal.r_level, cal.r_amount, cal.r_achi)
    }
    @IBOutlet weak var attendenceLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var achiLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    
    @IBOutlet weak var at_slider: UISlider!
    @IBOutlet weak var gr_slider: UISlider!
    @IBOutlet weak var am_slider: UISlider!
    @IBOutlet weak var ac_slider: UISlider!
    @IBOutlet weak var le_slider: UISlider!
    
    @IBAction func attendenceSlider(_ sender: UISlider) {
        attendenceLabel.text = "\(Int((sender.value-0.1)*100))%"
        realList[0] = sender.value
        rateList[0] = sender.value
        rateList = calRate(rateList)
        self_cal = changeAlgorithm(self_cal, rateList)
    }
    @IBAction func gradeSlider(_ sender: UISlider) {
        gradeLabel.text = "\(Int((sender.value-0.1)*100))%"
        realList[1] = sender.value
        rateList[1] = sender.value
        rateList = calRate(rateList)
        self_cal = changeAlgorithm(self_cal, rateList)
    }
    @IBAction func amountSlider(_ sender: UISlider) {
        amountLabel.text = "\(Int((sender.value-0.1)*100))%"
        realList[3] = sender.value
        rateList[3] = sender.value
        rateList = calRate(rateList)
        self_cal = changeAlgorithm(self_cal, rateList)
    }
    @IBAction func achiSlider(_ sender: UISlider) {
        achiLabel.text = "\(Int((sender.value-0.1)*100))%"
        realList[4] = sender.value
        rateList[4] = sender.value
        rateList = calRate(rateList)
        self_cal = changeAlgorithm(self_cal, rateList)
    }
    @IBAction func levelSlider(_ sender: UISlider) {
        levelLabel.text = "\(Int((sender.value-0.1)*100))%"
        realList[2] = sender.value
        rateList[2] = sender.value
        rateList = calRate(rateList)
        self_cal = changeAlgorithm(self_cal, rateList)
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
        at_slider.setValue(realList[0]+0.1, animated: true)
        gr_slider.setValue(realList[1]+0.1, animated: true)
        le_slider.setValue(realList[2]+0.1, animated: true)
        am_slider.setValue(realList[3]+0.1, animated: true)
        ac_slider.setValue(realList[4]+0.1, animated: true)
        attendenceLabel.text = "\(Int((at_slider.value-0.1)*100))%"
        gradeLabel.text = "\(Int((gr_slider.value-0.1)*100))%"
        levelLabel.text = "\(Int((le_slider.value-0.1)*100))%"
        amountLabel.text = "\(Int((am_slider.value-0.1)*100))%"
        achiLabel.text = "\(Int((ac_slider.value-0.1)*100))%"
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
