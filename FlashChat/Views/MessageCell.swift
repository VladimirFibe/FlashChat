//
//  MessageCell.swift
//  FlashChat
//
//  Created by Vladimir Fibe on 22.02.2022.
//

import UIKit

class MessageCell: UITableViewCell {
  let messageBublle = UIView()
  let name = UILabel()
  let rightImageView = UIImageView(image: UIImage(named: "MeAvatar"))
  let leftImageView = UIImageView(image: UIImage(named: "YouAvatar"))
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupUI() {
    
    name.text = "Cтоят два фpанцуза-подpостка. Один дpугому:\n- Как ты думаешь, что лучше - девушку тpахнуть или кpужку пива выпить?\n- Hе знаю - ПИВА не пpобовал..."
    name.numberOfLines = 0
    messageBublle.addSubview(name)
    messageBublle.layer.cornerRadius = 10
    messageBublle.backgroundColor = .brandPurple
    name.textColor = .brandLightPurple
    name.anchor(top: messageBublle.topAnchor, left: messageBublle.leftAnchor, bottom: messageBublle.bottomAnchor, right: messageBublle.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
    rightImageView.setDimensions(width: 40, height: 40)
    leftImageView.setDimensions(width: 40, height: 40)
    let stack = UIStackView(arrangedSubviews: [leftImageView, messageBublle, rightImageView])
    stack.axis = .horizontal
    stack.alignment = .top
    stack.distribution = .fill
    stack.spacing = 10
    contentView.addSubview(stack)
    stack.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
  }
}
