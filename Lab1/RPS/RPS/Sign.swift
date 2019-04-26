import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
  let sign = randomChoice.nextInt()
  if sign == 0 {
    return .rock
  } else if sign == 1 {
    return .paper
  } else {
    return .scissors
  }
}

enum Sign {
  case rock
  case paper
  case scissors

  var emoji: String {
    switch self {
    case .rock: return "💎"
    case .paper: return "🧻"
    case .scissors: return "⚔️"
    }
  }

  func getGameState(other: Sign?) -> GameState {
    guard let other = other else { return .start }
    switch (self, other) {

    case (.rock, .rock): return .draw
    case (.rock, .paper): return .lose
    case (.rock, .scissors): return .win

    case (.paper, .rock): return .win
    case (.paper, .paper): return .draw
    case (.paper, .scissors): return .lose

    case (.scissors, .rock): return .lose
    case (.scissors, .paper): return .win
    case (.scissors, .scissors): return .draw
    }
  }
}
