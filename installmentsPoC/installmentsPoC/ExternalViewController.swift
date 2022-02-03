//
//  ExternalViewController.swift
//  installmentsPoC
//
//  Created by Vitalii Terekhov on 18/01/2022.
//

import UIKit

class ExternalViewController: UIViewController {
    private let firstButton = UIButton()
    private let secondButton = UIButton()
    private let stackView = UIStackView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
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
            UIApplication.shared.open(url)
        }
    }

    @objc func secondTapped() {
        if let url = URL(string: "https://rozetka.com.ua/") {
            UIApplication.shared.open(url)
        }
    }
}
