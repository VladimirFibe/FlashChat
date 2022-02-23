//
//  Utilities.swift
//  FlashChat
//
//  Created by Vladimir Fibe on 22.02.2022.
//

import UIKit

class Utilities {
  static let shared = Utilities()
  
  func inputContainerView(textField: UITextField) -> UIView {
    let view = UIView()
    let imageView = UIImageView(image: UIImage(named: "textfield"))
    view.addSubview(imageView)
    imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingBottom: 20)
    textField.textAlignment = .center
    textField.font = .systemFont(ofSize: 25)
    view.addSubview(textField)
    textField.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 48, paddingRight: 48)
    return view
  }
}
