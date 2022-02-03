//
//  ShopView.swift
//  installmentsPoC
//
//  Created by Vitalii Terekhov on 03/02/2022.
//

import UIKit

protocol ShopViewDelegate {
    func buttonTapped(title: String)
}

class ShopView: UIView {
    private let imageView = UIImageView()
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let buttonStackView = UIStackView()
    
    private let buttons = ["Обувь", "Все", "Одежда", "Детям"]
    
    var delegate: ShopViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "clothes") ?? UIImage()
        imageView.clipsToBounds = true
        
        titleLabel.text = "Kasta Маркетплейс рiзного одягу"
        titleLabel.textColor = .darkGray
        titleLabel.font = .systemFont(ofSize: 18)
        
        buttonStackView.distribution = .fillEqually
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 10
        
        buttons.forEach { title in
            let button = UIButton()
            button.layer.cornerRadius = 15
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.setTitle(title, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 30)
            ])
            buttonStackView.addArrangedSubview(button)
        }
        
        stackView.backgroundColor = .lightGray
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(buttonStackView)
        buttonStackView.isLayoutMarginsRelativeArrangement = true
        buttonStackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 150),
//            imageView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        delegate?.buttonTapped(title: sender.title(for: .normal) ?? "")
        
    }
}
