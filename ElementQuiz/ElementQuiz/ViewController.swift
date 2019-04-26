//
//  ViewController.swift
//  ElementQuiz
//
//  Created by Daisuke Katsumata on 2019-04-16.
//  Copyright © 2019 kat8n. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

  let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]

  @IBOutlet var imageView: UIImageView!
  @IBOutlet var answerLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func showAnswer(_ sender: UIButton) {
  }

  @IBAction func gotoNextElement(_ sender: UIButton) {
  }
}
