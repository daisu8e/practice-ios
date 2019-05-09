import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {

  let phoneImageView: UIImageView = {
    let iv = UIImageView()
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.contentMode = .scaleAspectFill
    return iv
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(phoneImageView)
    phoneImageView.matchParent()

    guard let url = URL(string: "http://imgur.com/zdwdenZ.png") else { return }
    let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
    let task = session.downloadTask(with: url)
    task.resume()
  }

  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
    do {
      let data = try Data(contentsOf: location)
      OperationQueue.main.addOperation {
        self.phoneImageView.image = UIImage(data: data)
      }
    } catch {
      print(error)
    }
  }

  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
    print(progress)
  }

}

