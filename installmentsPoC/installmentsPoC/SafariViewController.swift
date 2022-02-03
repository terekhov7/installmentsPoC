//
//  SafariViewController.swift
//  installmentsPoC
//
//  Created by Vitalii Terekhov on 18/01/2022.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController, ShopViewDelegate {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let moneyView = MoneyView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.delegate = self
        
        stackView.addArrangedSubview(moneyView)
        (0...5).forEach { _ in
            let showView = ShopView()
            showView.delegate = self
            stackView.addArrangedSubview(showView)
        }

        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    func buttonTapped(title: String) {
        var link = ""
        switch title {
        case "Обувь":
            link = "https://kasta.ua/uk/?main=shoes"
        case "Все":
            link = "https://kasta.ua/uk/"
        case "Одежда":
            link = "https://kasta.ua/uk/?main=men"
        case "Детям":
            link = "https://kasta.ua/uk/?main=children"
        default:
            break
        }
        
        let actionSheet = UIAlertController(title: "Where do you want to open it", message: nil, preferredStyle: .actionSheet)
            
        if UIApplication.shared.canOpenURL(URL(string: link)!) {
            actionSheet.addAction(UIAlertAction(title: "Safari", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                UIApplication.shared.open(URL(string: link)!, options: [:], completionHandler: nil)
            }))
        }

        if UIApplication.shared.canOpenURL(URL(string: "googlechrome://\(link.replacingOccurrences(of: "https://", with: ""))")!) {
            actionSheet.addAction(UIAlertAction(title: "Chrome", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                UIApplication.shared.open(URL(string: "googlechrome://\(link.replacingOccurrences(of: "https://", with: ""))")!, options: [:], completionHandler: nil)
            }))
        }

        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
}

extension SafariViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 70 {
            navigationController?.navigationBar.isHidden = false
        } else {
            navigationController?.navigationBar.isHidden = true
        }
    }
}
