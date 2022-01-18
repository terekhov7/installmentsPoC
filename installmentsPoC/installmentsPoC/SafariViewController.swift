//
//  SafariViewController.swift
//  installmentsPoC
//
//  Created by Vitalii Terekhov on 18/01/2022.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {
    private let firstButton = UIButton()
    private let secondButton = UIButton()
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        firstButton.setTitle("KASTA", for: .normal)
        secondButton.setTitle("ROZETKA", for: .normal)
        
        [firstButton, secondButton].forEach { button in
            button.backgroundColor = .blue
            button.layer.cornerRadius = 5
            button.setTitleColor(.white, for: .normal)
            stackView.addArrangedSubview(button)
        }
        
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        firstButton.addTarget(self, action: #selector(firstTapped), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(secondTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func firstTapped() {
        if let url = URL(string: "https://kasta.ua/uk/") {
             let config = SFSafariViewController.Configuration()
             config.entersReaderIfAvailable = true

             let vc = SFSafariViewController(url: url, configuration: config)
             present(vc, animated: true)
        }
    }

    @objc func secondTapped() {
        if let url = URL(string: "https://rozetka.com.ua/") {
             let config = SFSafariViewController.Configuration()
             config.entersReaderIfAvailable = true

             let vc = SFSafariViewController(url: url, configuration: config)
             present(vc, animated: true)
        }
    }

}
