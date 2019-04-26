import UIKit

class ViewController: UIViewController {

  @IBOutlet var topCaptionSegmentedControl: UISegmentedControl!
  @IBOutlet var bottomCaptionSegmentedControl: UISegmentedControl!
  @IBOutlet var topCaptionLabel: UILabel!
  @IBOutlet var bottomCaptionLabel: UILabel!

  let topChoices: [CaptionChoice] = [
    CaptionChoice(emoji: "🕶", caption: "You know what's cool?"),
    CaptionChoice(emoji: "💥", caption: "You know what makes me mad?"),
    CaptionChoice(emoji: "💕", caption: "You know what I love?"),
  ]

  let bottomChoices: [CaptionChoice] = [
    CaptionChoice(emoji: "🐱", caption: "Cats wearing hats"),
    CaptionChoice(emoji: "🐶", caption: "Dogs carrying logs"),
    CaptionChoice(emoji: "🐵", caption: "Monkeys being funky"),
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    topCaptionSegmentedControl.removeAllSegments()
    topChoices.enumerated().forEach { topCaptionSegmentedControl.insertSegment(withTitle: $1.emoji, at: $0, animated: false) }
    topCaptionSegmentedControl.selectedSegmentIndex = 0

    bottomCaptionSegmentedControl.removeAllSegments()
    bottomChoices.enumerated().forEach { bottomCaptionSegmentedControl.insertSegment(withTitle: $1.emoji, at: $0, animated: false) }
    bottomCaptionSegmentedControl.selectedSegmentIndex = 0

    updateCaptionLabel()
  }

  private func updateCaptionLabel() {
    topCaptionLabel.text = topChoices[topCaptionSegmentedControl.selectedSegmentIndex].caption
    bottomCaptionLabel.text = bottomChoices[bottomCaptionSegmentedControl.selectedSegmentIndex].caption
  }

  @IBAction func selectCaption(_ sender: UISegmentedControl) {
    updateCaptionLabel()
  }

}
