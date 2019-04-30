import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

  let iconImageView: UIImageView = {
    let it = UIImageView()
    it.backgroundColor = .blue
    it.layer.cornerRadius = 12
    NSLayoutConstraint.activate([
      it.widthAnchor.constraint(equalToConstant: 64),
      it.heightAnchor.constraint(equalToConstant: 64),
    ])
    return it
  }()

  let nameLabel: UILabel = {
    let it = UILabel()
    it.text = "Instagram"
    return it
  }()

  let categoryLabel: UILabel = {
    let it = UILabel()
    it.text = "Photos & Videos"
    return it
  }()

  let ratingsLabel: UILabel = {
    let it = UILabel()
    it.text = "991K"
    return it
  }()

  let getButton: UIButton = {
    let it = UIButton(type: .system)
    it.setTitle("GET", for: .normal)
    it.setTitleColor(.blue, for: .normal)
    it.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    it.backgroundColor = UIColor(white: 0.95, alpha: 1)
    it.layer.cornerRadius = 16
    NSLayoutConstraint.activate([
      it.widthAnchor.constraint(equalToConstant: 80),
      it.heightAnchor.constraint(equalToConstant: 32),
    ])
    return it
  }()

  lazy var screenShotImage1: UIImageView = createScreenShotImageView()
  lazy var screenShotImage2: UIImageView = createScreenShotImageView()
  lazy var screenShotImage3: UIImageView = createScreenShotImageView()

  private func createScreenShotImageView() -> UIImageView {
    let it = UIImageView()
    it.backgroundColor = .green
    it.layer.cornerRadius = 7
    return it
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

//    contentView.backgroundColor = .white

    let labelsSV = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
    labelsSV.axis = .vertical

    let topRowSV = UIStackView(arrangedSubviews: [iconImageView, labelsSV, getButton])
    topRowSV.spacing = 12
    topRowSV.alignment = .center

    let screenShotSV = UIStackView(arrangedSubviews: [screenShotImage1, screenShotImage2, screenShotImage3])
    screenShotSV.spacing = 12
    screenShotSV.distribution = .fillEqually

    let wholeSV = UIStackView(arrangedSubviews: [topRowSV, screenShotSV])
    wholeSV.axis = .vertical
    wholeSV.spacing = 16

    addSubview(wholeSV)

    wholeSV.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      wholeSV.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      wholeSV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
      wholeSV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      wholeSV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
    ])
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

}
