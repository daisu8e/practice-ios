import UIKit

class ResultsViewController: UIViewController {

  @IBOutlet var resultAnswerLabel: UILabel!
  @IBOutlet var resultDefinitionLabel: UILabel!
  
  var responses: [Answer]!

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.hidesBackButton = true

    calculatePersonalityResult()
  }

  func calculatePersonalityResult() {
    var frequencyOfAnswers: [AnimalType: Int] = [:]
    for type in responses.map({ $0.type }) {
      frequencyOfAnswers[type] = (frequencyOfAnswers[type] ?? 0) + 1
    }

    let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
    resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
    resultDefinitionLabel.text = mostCommonAnswer.definition
  }

}
