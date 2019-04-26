import UIKit

class DetailsView: UIView {

  var ctrl: DetailsViewController!
  var city: UILabel!
  var country: UILabel!
  var weather: UILabel!
  var temperature: UILabel!
  var summary: UILabel!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  init(_ ctrl: DetailsViewController) {
    super.init(frame: CGRect.zero)

    self.ctrl = ctrl
    self.backgroundColor = .white
    self.city = createLabel(ctrl.model.city.name)
    self.country = createLabel(ctrl.model.city.country)
    self.weather = createLabel(ctrl.model.city.weather.image)
    self.temperature = createLabel(String(format: "%.1f °C", ctrl.model.city.temperature))
    self.summary = createLabel(ctrl.model.city.summary)

    addSubviews()
    constraint()
  }

  private func createLabel(_ text: String) -> UILabel {
    let l = UILabel()
    l.translatesAutoresizingMaskIntoConstraints = false
    l.text = text
    return l
  }

  private func addSubviews() {
    addSubview(city)
    addSubview(country)
    addSubview(weather)
    addSubview(temperature)
    addSubview(summary)
  }

  private func constraint() {
    NSLayoutConstraint.activate([
      city.centerXAnchor.constraint(equalTo: centerXAnchor),
      city.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),

      country.centerXAnchor.constraint(equalTo: centerXAnchor),
      country.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 50),

      weather.centerXAnchor.constraint(equalTo: centerXAnchor),
      weather.topAnchor.constraint(equalTo: country.bottomAnchor, constant: 50),

      temperature.centerXAnchor.constraint(equalTo: centerXAnchor),
      temperature.topAnchor.constraint(equalTo: weather.bottomAnchor, constant: 50),

      summary.centerXAnchor.constraint(equalTo: centerXAnchor),
      summary.topAnchor.constraint(equalTo: temperature.bottomAnchor, constant: 50),
    ])
  }

}
