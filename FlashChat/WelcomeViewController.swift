//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by Vladimir Fibe on 20.02.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
  // MARK: - Properties
  
  let titleLabel: CLTypingLabel = {
    let label = CLTypingLabel()
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
    button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    return button
  }()
  
  let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Login", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 30)
    button.backgroundColor = .systemTeal
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    return button
  }()

  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  // MARK: - Selectors
  
  @objc func handleRegister() {
    let viewController = RegisterViewController()
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  @objc func handleLogin() {
    let viewController = LoginViewController()
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  // MARK: - Helpers
  func configureUI() {
    view.backgroundColor = .systemBackground
    view.addSubview(titleLabel)
    titleLabel.center(inView: view)
    
    view.addSubview(loginButton)
    loginButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 50, height: 61)

    view.addSubview(registerButton)
    registerButton.anchor(left: view.leftAnchor, bottom: loginButton.topAnchor, right: view.rightAnchor, paddingBottom: 8, height: 61)
  }
}
