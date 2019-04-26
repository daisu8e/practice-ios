import UIKit

class CityViewController: UIViewController {

  let button: UIButton = {
    let b = UIButton(type: .system)
    b.translatesAutoresizingMaskIntoConstraints = false
    b.titleLabel?.font = .systemFont(ofSize: 200)
    b.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
    return b
  }()

  var city: City! {
    didSet {
      navigationItem.title = city.name
      tabBarItem = UITabBarItem(title: city.name, image: UIImage(named: city.icon), selectedImage: nil)
      button.setTitle(city.weather.image, for: .normal)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    view.addSubview(button)
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])

  }

  func render(city: City) {
    self.city = city
  }

  @objc private func showDetails() {
    let detailVC = DetailsViewController()
    detailVC.view.backgroundColor = .cyan
    detailVC.city = city
    navigationController?.pushViewController(detailVC, animated: true)
  }

}
