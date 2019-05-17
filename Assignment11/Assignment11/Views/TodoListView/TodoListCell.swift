import UIKit

class TodoListCell: UITableViewCell {

  var titleLabel: UILabel!

  override init(style: CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    self.titleLabel = createTitleLabel()

    addSubviews()
    constraint()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  func render(_ task: Task) {
    titleLabel.text = task.title
    backgroundColor = task.isCompleted ? .gray : .white
  }

  private func createTitleLabel() -> UILabel {
    let it = UILabel()
    it.translatesAutoresizingMaskIntoConstraints = false
    return it
  }

  private func addSubviews() {
    contentView.addSubview(titleLabel)
  }

  private func constraint() {
    NSLayoutConstraint.activate([
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
    ])
  }

}
