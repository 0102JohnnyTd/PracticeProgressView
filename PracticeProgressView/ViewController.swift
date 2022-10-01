//
//  ViewController.swift
//  PracticeProgressView
//
//  Created by Johnny Toda on 2022/09/16.
//

import UIKit

private enum AlertManager {
    static let alertTitile = "エラー"
    static let alertMessage = "0または10以上の値を取り扱うことはできません"
    static let alertActionTitle = "OK"
}

final class ViewController: UIViewController {
    @IBOutlet private weak var countLabel: UILabel!

    @IBOutlet private weak var countProgressView: UIProgressView!

    @IBAction private func didTapPlusButton(_ sender: Any) {
        guard counter.count < 10 else {
            showAlert()
            return
        }
        counter.increment()
        countProgressView.setProgress(countProgressView.progress + 0.1, animated: true)
    }

    @IBAction private func didTapMinusButton(_ sender: Any) {
        guard counter.count > 0 else {
            showAlert()
            return
        }
        counter.decrement()
        countProgressView.setProgress(countProgressView.progress - 0.1, animated: true)
    }

    private let counter = Counter()

    override func viewDidLoad() {
        super.viewDidLoad()
        counter.delegate = self
        setUpProgressView()
    }

    private func setUpProgressView() {
        countProgressView.progress = 0
    }

    private func updateCountLabel() {
        countLabel.text = String(counter.count) + " / " + "10"
    }

    private func showAlert() {
        let alertController = generateAlert()
        present(alertController, animated: true)
    }

    private func generateAlert() -> UIAlertController {
        let alertController = UIAlertController(title: AlertManager.alertTitile, message: AlertManager.alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: AlertManager.alertActionTitle, style: .default))
        return alertController
    }
}

extension ViewController: CounterDelegate {
    func didChangeCount() {
        updateCountLabel()
    }
}
