import UIKit

class MainTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    viewControllers = [
      createViewController(viewController: UIViewController(), title: "Today", image: "today"),
      createViewController(viewController: UIViewController(), title: "Games", image: "games"),
      createViewController(viewController: UIViewController(), title: "Apps", image: "apps"),
      createViewController(viewController: SearchViewController(), title: "Search", image: "search"),
    ]
  }

  private func createViewController(viewController: UIViewController, title: String, image: String) -> UIViewController {
    let vc = viewController
    vc.view.backgroundColor = .white
    vc.navigationItem.title = title
    let nc = UINavigationController(rootViewController: vc)
    nc.navigationBar.prefersLargeTitles = true
    nc.tabBarItem.title = title
    nc.tabBarItem.image = UIImage(named: image)
    return nc
  }

}
