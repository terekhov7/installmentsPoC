//
//  WebViewViewController.swift
//  installmentsPoC
//
//  Created by Vitalii Terekhov on 18/01/2022.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    private let firstButton = UIButton()
    private let secondButton = UIButton()
    private let stackView = UIStackView()
    
    private let webView = WKWebView()
    
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
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20)
        ])
    }
    
    @objc func firstTapped() {
        if let url = URL(string: "https://kasta.ua/uk/") {
            webView.load(URLRequest(url: url))
        }
    }

    @objc func secondTapped() {
        if let url = URL(string: "https://rozetka.com.ua/") {
            webView.load(URLRequest(url: url))
        }
    }
}
