//
//  BarChartViewController.swift
//  This_or_This
//
//  Created by John Herrick on 8/7/16.
//  Copyright © 2016 John Herrick. All rights reserved.
//

import UIKit
import Charts

/*class myValueFormatter : ValueFormatter{
    @objc func getFormattedValue(index: Float, original: String, dataSetIndex: Int, viewPortHandler: ChartViewPortHandler) -> String{
        print(original);
        return "\(Int(original))"
    }
}*/

class BarChartViewController: UIViewController {
    var months: [String]!
    var left: Int?
    var right: Int?

    @IBOutlet var barChartView: BarChartView!
  

    func setChart(dataPoints: [String], values: [Int?]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: Double(values[i]!), xIndex: i)
            dataEntries.append(dataEntry)
        }
        barChartView.frame = CGRectMake(0,0,self.view.frame.width,self.view.frame.height * 0.05)
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Votes")
        chartDataSet.colors = ChartColorTemplates.colorful()
        chartDataSet.valueFont = chartDataSet.valueFont.fontWithSize(50)
        chartDataSet.valueColors = ChartColorTemplates.joyful()
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        
        barChartView.xAxis.labelFont = barChartView.xAxis.labelFont.fontWithSize(15)
        barChartView.descriptionText="";
        
        barChartView.leftAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.drawGridLinesEnabled = false
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.leftAxis.drawAxisLineEnabled = false
        barChartView.rightAxis.drawAxisLineEnabled = false
        barChartView.leftAxis.drawLabelsEnabled = false
        barChartView.rightAxis.drawLabelsEnabled = false
        barChartView.legend.enabled = false
        barChartView.drawGridBackgroundEnabled = false
        
        barChartView.leftAxis.axisMinValue = 0;
        barChartView.rightAxis.axisMinValue = 0;
        barChartView.leftAxis.axisMaxValue+=10;
        barChartView.rightAxis.axisMaxValue+=10;
        
        barChartView.data = chartData
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 1.0)
    }
    override func viewDidLoad() {
        //self.view.userInteractionEnabled = false
        super.viewDidLoad()
        months = ["", ""]
        let unitsSold = [left, right]
        
        setChart(months, values: unitsSold)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func swipeDown(sender: UISwipeGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: nil)
        print("down")
    }
    @IBAction func swipeLeft(sender: UISwipeGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: nil)
        print("left")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
