//
//  OnboardingViewController.swift
//  BankeyiOS
//
//  Created by Martynas Tamulionis on 2022-11-11.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let monsterImageView = UIImageView()
    let titleLabel = UILabel()
    
    let monsterImageName: String
    let titleText: String
    
    init(monsterImageName: String, titleText: String) {
        self.monsterImageName = monsterImageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented - not using storyboards")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension OnboardingViewController {
    func style() {
        view.backgroundColor = .systemRed
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        
        // Image
        monsterImageView.translatesAutoresizingMaskIntoConstraints = false
        monsterImageView.contentMode = .scaleAspectFit
        monsterImageView.image = UIImage(named: monsterImageName)
        
        // Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .natural
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        titleLabel.text = titleText
    }
    
    func layout() {
        stackView.addArrangedSubview(monsterImageView)
        stackView.addArrangedSubview(titleLabel)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 600),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}
