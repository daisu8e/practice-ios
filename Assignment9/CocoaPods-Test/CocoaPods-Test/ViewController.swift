import UIKit
import ScrollableGraphView

class ViewController: UIViewController, ScrollableGraphViewDataSource {

  let numberOfDataPointsInGraph = 10
  let linePlotData: [Double] = [1, 7, 3, 8, 4, 7, 3, 6, 2, 9]

  override func viewDidLoad() {
    super.viewDidLoad()

    let graphView = ScrollableGraphView(frame: view.frame, dataSource: self)

    let linePlot = LinePlot(identifier: "line")
    let referenceLines = ReferenceLines()

    graphView.addPlot(plot: linePlot)
    graphView.addReferenceLines(referenceLines: referenceLines)

    view.addSubview(graphView)
  }

  func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
    switch(plot.identifier) {
    case "line":
      return linePlotData[pointIndex]
    default:
      return 0
    }
  }

  func label(atIndex pointIndex: Int) -> String {
    return "FEB \(pointIndex)"
  }

  func numberOfPoints() -> Int {
    return numberOfDataPointsInGraph
  }
}
