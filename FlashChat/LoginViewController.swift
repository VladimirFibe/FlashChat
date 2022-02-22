//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Vladimir Fibe on 20.02.2022.
//

import UIKit

class LoginViewController: UIViewController {
  // MARK: - Properties
  
  private let emailTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Email"
    return textField
  }()
  
  private let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Password"
    textField.isSecureTextEntry = true
    return textField
  }()
  
  private lazy var emailContatiner = Utilities.shared.inputContainerView(textField: emailTextField)
    
  private lazy var passwordContatiner = Utilities.shared.inputContainerView(textField: passwordTextField)
  
  private let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Log In", for: .normal)
    button.tintColor = UIColor(named: "BrandLightBlue")
    button.titleLabel?.font = .systemFont(ofSize: 30)
    button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
    return button
  }()
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  // MARK: - Selectors
  
  @objc func loginPressed() {
    print("DEBUG: Login")
  }
  
  // MARK: - Helpers
  func configureUI() {
    navigationController?.navigationBar.isHidden = true
    view.backgroundColor = UIColor(named: "BrandBlue")
    view.addSubview(emailContatiner)
    emailContatiner.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 177)
    view.addSubview(passwordContatiner)
    passwordContatiner.anchor(top: emailContatiner.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -100, height: 177)
    view.addSubview(loginButton)
    loginButton.centerX(inView: view, topAnchor: passwordContatiner.bottomAnchor, paddingTop: -50)
  }
  
}
