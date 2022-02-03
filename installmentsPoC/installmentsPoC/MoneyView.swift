//
//  MoneyView.swift
//  installmentsPoC
//
//  Created by Vitalii Terekhov on 03/02/2022.
//

import UIKit

class MoneyView: UIView {
    private let titleLabel = UILabel()
    private let priceLabel = UILabel()
    private let lastsLabel = UILabel()
    private let stackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        backgroundColor = .green
        
        titleLabel.text = "Гаманець на шопiнг"
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.textColor = .black
        
        priceLabel.text = "8454.77 ₴"
        priceLabel.font = .systemFont(ofSize: 22)
        priceLabel.textColor = .black
        
        lastsLabel.text = "Залишилось з 10000 ₴"
        lastsLabel.font = .systemFont(ofSize: 14)
        lastsLabel.textColor = .darkGray
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(lastsLabel)
        stackView.setCustomSpacing(30, after: titleLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
}
