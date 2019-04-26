import UIKit

class ViewController: UIViewController {

    @IBOutlet var appSign: UILabel!
    @IBOutlet var gameStatus: UILabel!
    @IBOutlet var rockButton: UIButton!
    @IBOutlet var paperButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var playAgainButton: UIButton!

    private let computerEmoji = "🐲"

    private var state: GameState = .start

    override func viewDidLoad() {
        super.viewDidLoad()

        rockButton.setTitle(Sign.rock.emoji, for: .normal)
        paperButton.setTitle(Sign.paper.emoji, for: .normal)
        scissorsButton.setTitle(Sign.scissors.emoji, for: .normal)

        updateUI()
    }

    private func updateUI() {
        switch state {

        case .start:
            appSign.text = computerEmoji
            gameStatus.text = "Rock, Paper, Scissors?"
            view.backgroundColor = .white
            beforePlay()

        case .win:
            gameStatus.text = "You won!"
            view.backgroundColor = .green
            afterPlay()

        case .draw:
            gameStatus.text = "Draw!"
            view.backgroundColor = .yellow
            afterPlay()

        case .lose:
            gameStatus.text = "You lost!"
            view.backgroundColor = .red
            afterPlay()
        }
    }

    private func beforePlay() {
        playAgainButton.isHidden = true
        rockButton.isEnabled = true
        paperButton.isEnabled = true
        scissorsButton.isEnabled = true
    }

    private func afterPlay() {
        playAgainButton.isHidden = false
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
    }

    @IBAction func play(_ sender: UIButton) {
        let computer = randomSign()
        appSign.text = computer.emoji

        var me: Sign?
        if sender.tag == 1 {
            me = Sign.rock
        } else if sender.tag == 2 {
            me = Sign.paper
        } else if sender.tag == 3 {
            me = Sign.scissors
        }
        if let me = me {
            state = me.getGameState(other: computer)
        }
        updateUI()
    }

    @IBAction func playAgain(_ sender: UIButton) {
        state = .start
        updateUI()
    }

}

