//
//  SecondViewController.swift
//  ProgrammaticPlayground
//
//  Created by Junho Choi on 20/06/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LOG IN"
        label.textAlignment = .center
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        return label
    }()
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let stView: UIStackView = {
        let stView = UIStackView()
        stView.axis = .vertical
        stView.distribution = .equalSpacing
        stView.alignment = .fill
        stView.spacing = 20.0
        return stView
    }()
    
    private let errorView: UIView = {
        let uv = UIView()
        uv.backgroundColor = .red
        return uv
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Wrong Password!"
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        usernameField.delegate = self
        passwordField.delegate = self
        loginButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        if errorView.isHidden {
            UIView.animate(withDuration: 0.2) {[unowned self] in
                errorView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.2) {[unowned self] in
                errorView.isHidden = true            }
        }
    }
    

    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        stView.translatesAutoresizingMaskIntoConstraints = false
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        errorView.addSubview(errorLabel)
        errorView.isHidden = true
        
        self.view.addSubview(stView)
        
        stView.addArrangedSubview(titleLabel)
        stView.addArrangedSubview(usernameLabel)
        stView.addArrangedSubview(usernameField)
        stView.addArrangedSubview(passwordLabel)
        stView.addArrangedSubview(passwordField)
        stView.addArrangedSubview(errorView)
        stView.addArrangedSubview(loginButton)
        
        NSLayoutConstraint.activate([
            stView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            stView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            errorView.heightAnchor.constraint(equalToConstant: 50),
            errorLabel.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: errorView.centerYAnchor),
            
        ])
    }
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
