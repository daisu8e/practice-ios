import Foundation

struct QuestionData {
}

struct Question {
  var text: String
  var type: ResponseType
  var answers: [Answer]
}

enum ResponseType {
  case single, multiple, ranged
}

struct Answer {
  var text: String
  var type: AnimalType
}

enum AnimalType: Character {
  case beef = "🐄", pork = "🐖", chiken = "🐓", horse = "🐎"

  var definition: String {
    switch self {
    case .beef:
      return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
    case .pork:
      return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
    case .chiken:
      return "You love everything that's soft. You are healthy and full of energy."
    case .horse:
      return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
    }
  }

}

