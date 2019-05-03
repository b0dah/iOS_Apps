/*
 
 //let NumberOfPoints = 100
 var DataEntry = [ChartDataEntry]()
 
 //var x_coord = 0.0
 
 for i in 0...1 {
 let point = ChartDataEntry(x: Double(i), y: Double(i))
 
 DataEntry.append(point)
 //x_coord+=0.1
 }
 
 let line1 = LineChartDataSet(values: DataEntry, label: "sine")
 line1.colors = [NSUIColor.green]
 
 let data = LineChartData()
 data.addDataSet(line1)
 
 lineChartView.data = data
 lineChartView.chartDescription?.text = "my awesome"
 }
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 
 }
 
 
 
 }*/

//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var lineChartView: LineChartView!
    
    @IBAction func drawButton(_ sender: UIButton) {
        let count = Int(arc4random_uniform(20) + 3)
        setChartValues()
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setChartValues()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//==================================================================
    func setChartValues() {
        
        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        let numberOfPoints = 100
        var x_coord = 0.0
        
        var DataEntry = [ChartDataEntry]()
        
        for i in 0..<numberOfPoints {
            let point = ChartDataEntry(x: Double(x_coord), y: Double(cos(x_coord)))
            x_coord += 0.1
            
            DataEntry.append(point)
        }
        
        let set1 = LineChartDataSet(values: DataEntry, label: "DataSet 1")
        set1.colors = ChartColorTemplates.vordiplom()
        
        let data = LineChartData(dataSet: set1)
        
        self.lineChartView.data = data
        
    }
    
}


