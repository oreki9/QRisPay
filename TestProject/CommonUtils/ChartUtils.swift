//
//  ChartUtils.swift
//  TestProject
//
//  Created by rickyTA on 04/02/24.
//

import Foundation
import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var donutChartView: PieChartView!
    @IBOutlet weak var lineChartView: LineChartView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load your JSON data here
        if let jsonData = jsonString.data(using: .utf8),
           let chartData = try? JSONDecoder().decode([ChartModel].self, from: jsonData) {
            
            // Create and configure donut chart
            configureDonutChart(data: chartData[0].data)

            // Create and configure line chart
            configureLineChart(data: chartData[1].data)
        }
    }

    func configureDonutChart(data: [DonutChartData]) {
        var entries: [ChartDataEntry] = []
        var labels: [String] = []

        for item in data {
            entries.append(PieChartDataEntry(value: item.percentage, label: item.label))
            labels.append(item.label)
        }

        let dataSet = PieChartDataSet(entries: entries, label: nil)
        dataSet.colors = ChartColorTemplates.vordiplom()

        let data = PieChartData(dataSet: dataSet)
        donutChartView.data = data
        donutChartView.centerText = "Donut Chart"
    }

    func configureLineChart(data: [Int]) {
        var entries: [ChartDataEntry] = []

        for (index, value) in data.enumerated() {
            entries.append(ChartDataEntry(x: Double(index), y: Double(value)))
        }

        let dataSet = LineChartDataSet(entries: entries, label: "Line Chart")
        dataSet.colors = [NSUIColor.blue]

        let data = LineChartData(dataSet: dataSet)
        lineChartView.data = data
        lineChartView.chartDescription?.text = "Line Chart"
    }
}

struct ChartModel: Codable {
    let type: String
    let data: ChartData
}

struct ChartData: Codable {
    let label: String?
    let percentage: Double?
    let data: [DonutChartData]?
}

struct DonutChartData: Codable {
    let label: String
    let percentage: Double
    let data: [TransactionData]?
}

struct TransactionData: Codable {
    let trx_date: String
    let nominal: Double
}