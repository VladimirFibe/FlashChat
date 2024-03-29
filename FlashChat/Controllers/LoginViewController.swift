import UIKit
import Firebase

class LoginViewController: UIViewController {
    // MARK: - Properties
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.text = ""
        textField.placeholder = "Email"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.text = ""
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var emailContatiner = Utilities.shared.inputContainerView(textField: emailTextField)
    
    private lazy var passwordContatiner = Utilities.shared.inputContainerView(textField: passwordTextField)
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.tintColor = .brandLightBlue
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
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
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
        view.backgroundColor = .brandBlue
        view.addSubview(emailContatiner)
        emailContatiner.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 177)
        view.addSubview(passwordContatiner)
        passwordContatiner.anchor(top: emailContatiner.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -100, height: 177)
        view.addSubview(loginButton)
        loginButton.centerX(inView: view, topAnchor: passwordContatiner.bottomAnchor, paddingTop: -50)
    }
    
}
