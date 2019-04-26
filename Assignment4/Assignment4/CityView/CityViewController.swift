import UIKit

class CityViewController: UIViewController {

  var model: CityViewModel!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }

  init(_ city: City) {
    super.init(nibName: nil, bundle: nil)

    self.model = CityViewModel(city: city)

    initTabBarItem()
    initNavigationItem()
  }

  private func initTabBarItem() {
    tabBarItem = UITabBarItem(title: model.city.name, image: UIImage(named: model.city.icon), selectedImage: nil)
  }

  private func initNavigationItem() {
    navigationItem.title = model.city.name
  }

  override func loadView() {
    self.view = CityView(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func showDetails() {
    navigationController?.pushViewController(DetailsViewController(model.city), animated: true)
  }

}
