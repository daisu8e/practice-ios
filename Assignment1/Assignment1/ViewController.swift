import UIKit

class ViewController: UIViewController {

  let greenBox = UIView()
  let purpleBox = UIView()
  let blueBoxes = UIStackView()
  let blueBox1 = UIView()
  let blueBox2 = UIView()
  let blueBox3 = UIView()
  let redBox = UIView()
  let orangeBox1 = UIView()
  let orangeBox2 = UIView()

  let buttons = UIStackView()
  let squareButton = UIButton(type: .system)
  let portraitButton = UIButton(type: .system)
  let landscapeButton = UIButton(type: .system)

  var animationConstraints: [NSLayoutConstraint] = [] {
    willSet {
      NSLayoutConstraint.deactivate(animationConstraints)
    }
    didSet {
      NSLayoutConstraint.activate(animationConstraints)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    initOrangeBox1()
    initOrangeBox2()
    initRedBox()
    initBlueBox1()
    initBlueBox2()
    initBlueBox3()
    initBlueBoxes()
    initPurpleBox()
    initMainView()

    initSquareButton()
    initPortraitButton()
    initLandscapeButton()
    initButtons()

    initView()

    constrain()
  }

  private func initOrangeBox1() {
    initOrangeBox(orangeBox1)
  }

  private func initOrangeBox2() {
    initOrangeBox(orangeBox2)
  }

  private func initOrangeBox(_ box: UIView) {
    let v = box
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .orange
  }

  private func initRedBox() {
    let v = redBox
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .red
  }

  private func initBlueBox1() {
    initBlueBox(blueBox1)
  }

  private func initBlueBox2() {
    initBlueBox(blueBox2)
  }

  private func initBlueBox3() {
    initBlueBox(blueBox3)
  }

  private func initBlueBox(_ box: UIView) {
    let v = box
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .blue
  }

  private func initBlueBoxes() {
    let v = blueBoxes
    v.addArrangedSubview(blueBox1)
    v.addArrangedSubview(blueBox2)
    v.addArrangedSubview(blueBox3)
    v.translatesAutoresizingMaskIntoConstraints = false
    v.axis = .vertical
    v.distribution = .equalSpacing
  }

  private func initPurpleBox() {
    let v = purpleBox
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .purple
  }

  private func initMainView() {
    let v = greenBox
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .green
  }

  private func initSquareButton() {
    initButton(squareButton, title: "Square", action: #selector(squareTapped))
  }

  private func initPortraitButton() {
    initButton(portraitButton, title: "Portrait", action: #selector(portraitTapped))
  }

  private func initLandscapeButton() {
    initButton(landscapeButton, title: "Landscape", action: #selector(landscapeTapped))
  }

  private func initButton(_ button: UIButton, title: String, action: Selector) {
    let b = button
    b.translatesAutoresizingMaskIntoConstraints = false
    b.setTitle(title, for: .normal)
    b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    b.addTarget(self, action: action, for: .touchUpInside)
  }

  private func initButtons() {
    let v = buttons
    v.addArrangedSubview(squareButton)
    v.addArrangedSubview(portraitButton)
    v.addArrangedSubview(landscapeButton)
    v.translatesAutoresizingMaskIntoConstraints = false
    v.axis = .horizontal
    v.distribution = .fillEqually
    v.alignment = .center
  }

  private func initView() {
    view.backgroundColor = .white
    view.addSubview(greenBox)
    view.addSubview(purpleBox)
    view.addSubview(blueBoxes)
    view.addSubview(redBox)
    view.addSubview(orangeBox1)
    view.addSubview(orangeBox2)
    view.addSubview(buttons)
  }

  private func constrain() {
    animationConstraints = [
      greenBox.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
      greenBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
    ]

    NSLayoutConstraint.activate([
      greenBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      greenBox.centerYAnchor.constraint(equalTo: view.centerYAnchor),

      purpleBox.trailingAnchor.constraint(equalTo: greenBox.trailingAnchor, constant: -30),
      purpleBox.bottomAnchor.constraint(equalTo: greenBox.bottomAnchor, constant: -30),
      purpleBox.widthAnchor.constraint(equalTo: greenBox.widthAnchor, multiplier: 0.7),
      purpleBox.heightAnchor.constraint(equalToConstant: 50),

      blueBox1.widthAnchor.constraint(equalToConstant: 50),
      blueBox1.heightAnchor.constraint(equalToConstant: 50),

      blueBox2.widthAnchor.constraint(equalToConstant: 50),
      blueBox2.heightAnchor.constraint(equalToConstant: 50),

      blueBox3.widthAnchor.constraint(equalToConstant: 50),
      blueBox3.heightAnchor.constraint(equalToConstant: 50),

      blueBoxes.centerXAnchor.constraint(equalTo: greenBox.centerXAnchor),
      blueBoxes.centerYAnchor.constraint(equalTo: greenBox.centerYAnchor),
      blueBoxes.heightAnchor.constraint(equalTo: greenBox.heightAnchor, multiplier: 0.7),

      redBox.topAnchor.constraint(equalTo: greenBox.topAnchor, constant: 30),
      redBox.trailingAnchor.constraint(equalTo: greenBox.trailingAnchor, constant: -30),
      redBox.widthAnchor.constraint(equalToConstant: 150),
      redBox.heightAnchor.constraint(equalToConstant: 50),

      orangeBox1.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 5),
      orangeBox1.leadingAnchor.constraint(equalTo: redBox.leadingAnchor, constant: 5),
      orangeBox1.bottomAnchor.constraint(equalTo: redBox.bottomAnchor, constant: -5),
      orangeBox1.widthAnchor.constraint(equalTo: redBox.widthAnchor, multiplier: 0.6),

      orangeBox2.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 5),
      orangeBox2.leadingAnchor.constraint(equalTo: orangeBox1.trailingAnchor, constant: 5),
      orangeBox2.trailingAnchor.constraint(equalTo: redBox.trailingAnchor, constant: -5),
      orangeBox2.bottomAnchor.constraint(equalTo: redBox.bottomAnchor, constant: -5),

      buttons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttons.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttons.widthAnchor.constraint(equalTo: view.widthAnchor),
      buttons.heightAnchor.constraint(equalToConstant: 50),
    ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
      self.animationConstraints = [
        self.greenBox.widthAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6),
        self.greenBox.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6),
      ]
      self.view.layoutIfNeeded()
    })
  }

  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
      self.animationConstraints = [
        self.greenBox.widthAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4),
        self.greenBox.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4),
      ]
      self.view.layoutIfNeeded()
    })
  }

  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
      self.animationConstraints = [
        self.greenBox.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95),
        self.greenBox.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4),
      ]
      self.view.layoutIfNeeded()
    })
  }

}
