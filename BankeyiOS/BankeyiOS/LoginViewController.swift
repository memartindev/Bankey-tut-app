//
//  LoginViewController.swift
//  BankeyiOS
//
//  Created by Martynas Tamulionis on 2022-11-02.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    let signButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let errorMessageText = "Username / password cannot be blank"
    let appNameLabel = UILabel()
    let appPromoTextLabel = UILabel()
    
    var userName: String? {
        loginView.usernameTextfield.text
    }
    
    var password: String? {
        loginView.passwordTextfield.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.configuration = .filled()
        signButton.configuration?.imagePadding = 8
        signButton.setTitle("Sign in", for: .normal)
        signButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        errorMessageLabel.text = errorMessageText
        errorMessageLabel.font = UIFont(name: "Avenir", size: 14)
        
        appPromoTextLabel.translatesAutoresizingMaskIntoConstraints = false
        appPromoTextLabel.textAlignment = .center
        appPromoTextLabel.numberOfLines = 0
        appPromoTextLabel.text = "Your premium source for all things banking! memartindev"
        appPromoTextLabel.font = UIFont(name: "Helvetica Neue Bold", size: 16)
        appPromoTextLabel.textColor = .darkGray
        
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.textAlignment = .center
        appNameLabel.numberOfLines = 0
        appNameLabel.text = "Bankey"
        appNameLabel.font = UIFont(name: "Baskerville", size: 45)
        appNameLabel.textColor = .darkText
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signButton)
        view.addSubview(errorMessageLabel)
        view.addSubview(appPromoTextLabel)
        view.addSubview(appNameLabel)
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: appPromoTextLabel.bottomAnchor, multiplier: 6),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2)
        ])
        
        // SignInButton
        NSLayoutConstraint.activate([
            signButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // Error Label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // AppPromoText Label
        NSLayoutConstraint.activate([
            appPromoTextLabel.topAnchor.constraint(equalToSystemSpacingBelow: appNameLabel.bottomAnchor, multiplier: 4),
            appPromoTextLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            appPromoTextLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // AppNameTitle Label
        NSLayoutConstraint.activate([
            appNameLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            appNameLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

// MARK: Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = userName, let password = password else {
            assertionFailure("Username / password should not be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: errorMessageText)
            return
        }
        
        if username == "Martin" && password == "123" {
            signButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username/ psw")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
