//
//  RadarChartViewController.swift
//  GGULUE
//
//  Created by KimYoungHoon on 2018. 8. 9..
//  Copyright © 2018년 GGULUE. All rights reserved.
//

import UIKit
//import TKRadarChart

class RadarChartViewController: UIViewController, TKRadarChartDataSource, TKRadarChartDelegate, UITableViewDelegate {
    let itemArray = ["출석", "난이도", "학습량", "학점", "성취감"]
    var selectedLecture : Lecture?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let w = view.bounds.width
        let chart = TKRadarChart(frame: CGRect(x: 0, y: 0, width: w, height: w))
        chart.configuration.radius = w/3
        chart.dataSource = self
        chart.delegate = self
//        chart.center = view.center
        chart.reloadData()
        view.addSubview(chart)
    }
    
    func numberOfStepForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 5
    }
    func numberOfRowForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 5
    }
    func numberOfSectionForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 1
    }
    
    func titleOfRowForRadarChart(_ radarChart: TKRadarChart, row: Int) -> String {
        return "\(itemArray[row])"
    }
    
    func valueOfSectionForRadarChart(withRow row: Int, section: Int) -> CGFloat {
        var newScoreArray : [Double] = [0, 0, 0, 0, 0]
        for item in (selectedLecture?.fivescore)!{
            newScoreArray[row] += item[row]!
        }
        return CGFloat(newScoreArray[row])
    }
    
    
    func colorOfLineForRadarChart(_ radarChart: TKRadarChart) -> UIColor {
        return UIColor(red:1,  green:200/255,  blue:100/255, alpha:1)
    }
    
    func colorOfFillStepForRadarChart(_ radarChart: TKRadarChart, step: Int) -> UIColor {
        switch step {
        case 1:
            return UIColor(red:0.996,  green:0.806,  blue:0.345, alpha:1)
        case 2:
            return UIColor(red:0.988,  green:0.829,  blue:0.506, alpha:1)
        case 3:
            return UIColor(red:0.984,  green:0.849,  blue:0.631, alpha:1)
        case 4:
            return UIColor(red:0.988,  green:0.876,  blue:0.722, alpha:1)
        default:
            return UIColor.white
        }
    }
    
    func colorOfSectionFillForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return UIColor(red:1,  green:127/255,  blue:0, alpha:0.4)
        } else {
            return UIColor(red:0,  green:0.788,  blue:0.543, alpha:0.4)
        }
    }
    
    func colorOfSectionBorderForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return UIColor(red:1,  green:0.867,  blue:0.012, alpha:1)
        } else {
            return UIColor(red:0,  green:0.788,  blue:0.543, alpha:1)
        }
    }
    
    func fontOfTitleForRadarChart(_ radarChart: TKRadarChart) -> UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
}
