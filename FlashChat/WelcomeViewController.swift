//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by Vladimir Fibe on 20.02.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "⚡️FlashChat"
    label.textColor = UIColor(named: "BrandBlue")
    label.font = .systemFont(ofSize: 50, weight: .black)
    return label
  }()
  
  let registerButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Register", for: .normal)
    button.setTitleColor(UIColor(named: "BrandBlue"), for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 30)
    button.backgroundColor = UIColor(named: "BrandLightBlue")
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 61).isActive = true
    button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    return button
  }()
  
  let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Login", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 30)
    button.backgroundColor = .systemTeal
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 61).isActive = true
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    view.addSubview(loginButton)
    loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    
    view.addSubview(registerButton)
    registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    registerButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -8).isActive = true
  }
  
  @objc func handleRegister() {
    let viewController = RegisterViewController()
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  @objc func handleLogin() {
    let viewController = LoginViewController()
    navigationController?.pushViewController(viewController, animated: true)
  }
}
