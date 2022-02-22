//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Vladimir Fibe on 21.02.2022.
//

import UIKit
import Firebase
class ChatViewController: UIViewController {
  // MARK: - Properties
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  // MARK: - Selectors
  @objc func logoutTapped() {
    do {
      try Auth.auth().signOut()
      navigationController?.popToRootViewController(animated: true)
    } catch {
      print("DEBUG: \(error.localizedDescription)")
    }
  }
  // MARK: - Helpers
  func configureUI() {
    view.backgroundColor = .orange
    navigationController?.navigationBar.isHidden = false
    title = "⚡️FlashChat"
    navigationItem.hidesBackButton = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
  }
}
