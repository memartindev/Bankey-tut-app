//
//  LoginView.swift
//  BankeyiOS
//
//  Created by Martin T on 2022-11-02.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let stackView = UIStackView()
    let usernameTextfield = UITextField()
    let passwordTextfield = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    we are setting default view size, but it could change with constraints and etc
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 200, height: 200)
//    }
    
    
}

extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemFill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
        usernameTextfield.placeholder = "username"
        usernameTextfield.delegate = self
        
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        passwordTextfield.placeholder = "pasword"
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.delegate = self
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
    
    func layout() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(usernameTextfield)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextfield)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 1),
            self.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1),
            self.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextfield.endEditing(true)
        passwordTextfield.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //
    }
}


