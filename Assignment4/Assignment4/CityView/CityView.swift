import UIKit

class CityView: UIView {

  var ctrl: CityViewController!
  var button: UIButton!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(_ ctrl: CityViewController) {
    super.init(frame: CGRect.zero)

    self.ctrl = ctrl
    self.backgroundColor = .white
    self.button = createButton(city: ctrl.model.city)

    addSubviews()
    constraint()
  }

  private func createButton(city: City) -> UIButton {
    let b = UIButton(type: .system)
    b.translatesAutoresizingMaskIntoConstraints = false
    b.setTitle(city.weather.image, for: .normal)
    b.titleLabel?.font = .systemFont(ofSize: 200)
    b.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
    return b
  }

  @objc private func clickButton() {
    ctrl.showDetails()
  }

  private func addSubviews() {
    addSubview(button)
  }

  private func constraint() {
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: centerXAnchor),
      button.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }

}
