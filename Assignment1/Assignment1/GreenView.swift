import UIKit

class GreenView: UIView {

  let purpleView: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .purple
    return v
  }()

  let blueStackView: UIStackView = {
    let v = UIStackView(arrangedSubviews: [
      UIView(),
      createBlueView(),
      createBlueView(),
      createBlueView(),
      UIView(),
    ])
    v.translatesAutoresizingMaskIntoConstraints = false
    v.axis = .vertical
    v.distribution = .equalSpacing
    return v
  }()

  let redView: UIView = {
    let v  = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .red

    let orangeView1 = UIView(frame: CGRect(x: 10, y: 10, width: 140, height: 60))
    orangeView1.backgroundColor = .orange

    let orangeView2 = UIView(frame: CGRect(x: 160, y: 10, width: 90, height: 60))
    orangeView2.backgroundColor = .orange

    v.addSubview(orangeView1)
    v.addSubview(orangeView2)

    return v
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .green

    initPurpleView()
    initBlueStackView()

  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  private func initPurpleView() {
    addSubview(purpleView)
    NSLayoutConstraint.activate([
      purpleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
      purpleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
      purpleView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
      purpleView.heightAnchor.constraint(equalToConstant: 80),
    ])
  }

  private func initBlueStackView() {
    addSubview(blueStackView)
    NSLayoutConstraint.activate([
      blueStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      blueStackView.heightAnchor.constraint(equalTo: heightAnchor),
    ])
  }

  private func initRedView() {
    addSubview(redView)
    NSLayoutConstraint.activate([
      redView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
      redView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      redView.widthAnchor.constraint(equalToConstant: 260),
      redView.heightAnchor.constraint(equalToConstant: 80),
    ])
  }

  private static func createBlueView() -> UIView {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .blue
    NSLayoutConstraint.activate([
      v.widthAnchor.constraint(equalToConstant: 80),
      v.heightAnchor.constraint(equalToConstant: 80),
    ])
    return v
  }

}


