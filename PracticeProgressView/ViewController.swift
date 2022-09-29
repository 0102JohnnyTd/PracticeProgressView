//
//  ViewController.swift
//  PracticeProgressView
//
//  Created by Johnny Toda on 2022/09/16.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var countLabel: UILabel!

    @IBOutlet private weak var countProgressView: UIProgressView!

    @IBAction private func didTapPlusButton(_ sender: Any) {
        counter.increment()
    }

    @IBAction private func didTapMinusButton(_ sender: Any) {
        counter.decrement()
    }

    private let counter = Counter()

    override func viewDidLoad() {
        super.viewDidLoad()
        counter.delegate = self
    }

    private func updateCountLabel() {
        countLabel.text = String(counter.count) + " / " + "10"
    }
}

extension ViewController: CounterDelegate {
    func didChangeCount() {
        updateCountLabel()
    }
}
