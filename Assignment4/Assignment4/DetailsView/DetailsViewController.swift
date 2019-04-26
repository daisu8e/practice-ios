import UIKit

class DetailsViewController: UIViewController {

  var model: DetailsViewModel!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }

  init(_ city: City) {
    super.init(nibName: nil, bundle: nil)

    self.model = DetailsViewModel(city: city)
  }

  override func loadView() {
    self.view = DetailsView(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

}
