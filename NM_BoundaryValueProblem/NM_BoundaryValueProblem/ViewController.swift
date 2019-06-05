//
//  ViewController.swift
//  NM_BoundaryValueProblem
//
//  Created by Иван Романов on 04/06/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import UIKit
import Charts

var EXAMPLE = 1
let e = 2.7182
let π = Float.pi

func p681(x: Double) -> Double {
    return 4*x/Double(2*x+1)
}

func q681(x: Double)->Double {
    return -4/Double(2*x+1)
}

func f681(x: Double) -> Double {
    return 0
}

func solution681(x: Double) -> Double {
    return (1-3*e*e)*x - e * e * exp(-2*x)
    
}




func p683(x: Double) -> Double {
    return -(2*x+1)/x
}

func q683(x: Double)->Double {
    return (x+1)/x
}

func f683(x: Double) -> Double {
    return 0
}

func solution683(x: Double) -> Double {
    return exp(x)*( 1/e * x*x + 1.0 + 1/e)
    
}






func p688(x: Double) -> Double {
    return -1/x*log(x)
}

func q688(x: Double)->Double {
    return 1/x*x * log(x)
}

func f688(x: Double) -> Double {
    return 0
}

func solution688(x: Double) -> Double {
    return -1/(1.5 - 2*log(2.0))*x + 1/(1.5 - 2.0*log(2.0))*(log(x)+1.0)
    
}


func p0(x: Double) -> Double {
    return 0
}

func q0(x: Double)->Double {
    return 1
}

func f0(x: Double) -> Double {
    return 1
}

func solution0(x: Double) -> Double {
    return 1 + cos(x)
    
}



func p1(x: Double) -> Double {
    return 1
}

func q1(x: Double)->Double {
    return 0
}

func f1(x: Double) -> Double {
    return 1
}

func solution1(x: Double) -> Double {
    return exp(-x) - exp(-1) + x
}

class ViewController: UIViewController {

    @IBOutlet weak var chartView: LineChartView!
    
    @IBAction func reDrawButton(_ sender: UIButton) {
        EXAMPLE += 1
        drawChart()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawChart()

     
    }

    func drawChart() {
        
        var ex = 🤯(a: 0, b: 1, k1: -1, k2: 1, a1: 1, l1: -1, l2: 1, b1: 3, p: p681, q: q681, f: f681, solution: solution681)// 681
        
        switch EXAMPLE {
        case 1:
            ex = 🤯(a: 0, b: 1, k1: -1, k2: 1, a1: 1, l1: -1, l2: 1, b1: 3, p: p681, q: q681, f: f681, solution: solution681)// 681
        case 2:
            ex = 🤯(a: 0, b: 1, k1: 0, k2: 1, a1: 0, l1: 1, l2: 0, b1: 1, p: p1, q: q1, f: f1, solution: solution1)
        default:
            ex = 🤯(a: 0, b: Double(π/2), k1: 0, k2: 1, a1: 0, l1: 1, l2: -1, b1: 2, p: p0, q: q0, f: f0, solution: solution0)
        }
        
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        var dataEntry = [ChartDataEntry](), solutionDataEntry = [ChartDataEntry]()
        
        for i in 0..<ex.u.count {
            let point = ChartDataEntry(x: ex.t[i], y: ex.u[i])
            let solutionPoint = ChartDataEntry(x: ex.t[i], y: ex.preciseSolution[i])
            
            dataEntry.append(point)
            solutionDataEntry.append(solutionPoint)
        }
        
        let line = LineChartDataSet(values: dataEntry, label: "Computed")
        line.colors = [UIColor.blue]
        line.circleRadius = 8
        
        let solutionLine = LineChartDataSet(values: solutionDataEntry, label: "Precise")
        solutionLine.colors = [UIColor.orange]
        solutionLine.circleRadius = 4
        solutionLine.circleColors = [UIColor.orange]
        
        let data = LineChartData(dataSets: [line, solutionLine])
        self.chartView.data = data
    }

}

