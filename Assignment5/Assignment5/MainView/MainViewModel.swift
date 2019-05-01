import Foundation

class MainViewModel {

  let defaultTipPercentage: Int = 15

  private(set) var billAmount: Double
  private(set) var tipPercentage: Int
  private(set) var tipAmount: Double

  init() {
    self.billAmount = 0
    self.tipPercentage = defaultTipPercentage
    self.tipAmount = 0
    calculateTipAmount()
  }

  func update(billAmount: Double) {
    self.billAmount = billAmount
    calculateTipAmount()
  }

  func update(tipPercentage: Int) {
    self.tipPercentage = tipPercentage
    calculateTipAmount()
  }

  private func calculateTipAmount() {
    tipAmount = billAmount * Double(tipPercentage) / 100
    tipAmount = round(tipAmount * 1000) / 1000
  }
}
