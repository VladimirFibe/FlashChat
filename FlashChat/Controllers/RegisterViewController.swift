//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Vladimir Fibe on 20.02.2022.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
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
  
  private let registerButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Register", for: .normal)
    button.tintColor = .brandBlue
    button.titleLabel?.font = .systemFont(ofSize: 30)
    button.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
    return button
  }()
  
  // MARK: - Lifecycle
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.tintColor = .brandBlue
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.navigationBar.tintColor = .white
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  // MARK: - Selectors
  
  @objc func registerPressed() {
    guard let email = emailTextField.text else { return }
    guard let password = passwordTextField.text else { return }
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      if let error = error {
        print("DEBUG: \(error.localizedDescription)")
      } else {
        let viewController = ChatViewController ()
        self.navigationController?.pushViewController(viewController, animated: true)
      }
    }
  }
  
  // MARK: - Helpers
  func configureUI() {
    view.backgroundColor = .brandLightBlue
    view.addSubview(emailContatiner)
    emailContatiner.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 177)
    view.addSubview(passwordContatiner)
    passwordContatiner.anchor(top: emailContatiner.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -100, height: 177)
    view.addSubview(registerButton)
    registerButton.centerX(inView: view, topAnchor: passwordContatiner.bottomAnchor, paddingTop: -50)
  }
  
}
