import UIKit

@objc protocol ToDoCellDelegate: class {
  func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {

  @IBOutlet var isCompleteButton: UIButton!
  @IBOutlet var titleLabel: UILabel!

  var delegate: ToDoCellDelegate?

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  @IBAction func completeButtonTapped(_ sender: UIButton) {
    delegate?.checkmarkTapped(sender: self)
  }
  
}
