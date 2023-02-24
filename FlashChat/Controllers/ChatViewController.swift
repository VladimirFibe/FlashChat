import UIKit
import Firebase
class ChatViewController: UIViewController {
    // MARK: - Properties
    let db = Firestore.firestore()
    var messages: [Message] = []
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        return tableView
    }()
    
    let messageTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .brandPurple
        textField.placeholder = "Write message..."
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(send), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadMessages()
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
    
    @objc func send() {
        guard let body = messageTextField.text, !body.isEmpty else { return }
        guard let sender = Auth.auth().currentUser?.email else { return }
        db.collection(Constants.FStore.collection).addDocument(data: [
            Constants.FStore.sender : sender,
            Constants.FStore.body: body,
            Constants.FStore.date: Date()
        ]) { error in
            if let error = error {
                print("DEBUG: There was an issue saving data to firestore,  \(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    self.messageTextField.text = ""
                }
            }
        }
        
    }
    // MARK: - FireStore
    func loadMessages() {
        db.collection(Constants.FStore.collection)
            .order(by: Constants.FStore.date)
            .addSnapshotListener { query, error in
                if let error = error {
                    print("DEBUG: There was an issue retrieving data from Firestore. \(error.localizedDescription)")
                } else {
                    self.messages = []
                    guard let snapshot = query?.documents else { return }
                    for doc in snapshot {
                        let data = doc.data()
                        if let sender = data[Constants.FStore.sender] as? String,
                           let body = data[Constants.FStore.body] as? String {
                            let newMessage = Message(sender: sender, body: body)
                            self.messages.append(newMessage)
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        if self.messages.count > 0 {
                            let indexPath = IndexPath(item: self.messages.count - 1, section: 0)
                            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                        }
                    }
                }
            }
        
    }
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .brandPurple
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
        title = Constants.appName
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        
        let messageView = UIView()
        messageView.backgroundColor = .brandPurple
        view.addSubview(messageView)
        messageView.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, height: 60)
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: messageView.topAnchor, right: view.rightAnchor)
        messageView.addSubview(sendButton)
        sendButton.anchor(top: messageView.topAnchor, right: messageView.rightAnchor, paddingTop: 20, paddingRight: 20, width: 40, height: 40)
        messageView.addSubview(messageTextField)
        messageTextField.anchor(top: messageView.topAnchor, left: messageView.leftAnchor, right: sendButton.leftAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20, height: 40)
    }
}
// MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MessageCell()
        let message = messages[indexPath.row]
        cell.name.text = message.body
        cell.isUserInteractionEnabled = false
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBublle.backgroundColor = .brandPurple
            cell.name.textColor = .white
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBublle.backgroundColor = .brandLightPurple
            cell.name.textColor = .brandPurple
        }
        return cell
    }
}
// MARK: - UITableViewDelegate
extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
