/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The view where the user can sign in, or create an account.
*/

import AuthenticationServices
import UIKit
import os

class SignInViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!

    private var signInObserver: NSObjectProtocol?
    private var signInErrorObserver: NSObjectProtocol?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        signInObserver = NotificationCenter.default.addObserver(forName: .UserSignedIn, object: nil, queue: nil) { name in
            self.didFinishSignIn(username: name.object as! String)
        }

        signInErrorObserver = NotificationCenter.default.addObserver(forName: .ModalSignInSheetCanceled, object: nil, queue: nil) { _ in
            self.showSignInForm()
        }

        guard let window = self.view.window else { fatalError("The view was not in the app's view hierarchy!") }
        (UIApplication.shared.delegate as? AppDelegate)?.accountManager.signInWith(anchor: window, preferImmediatelyAvailableCredentials: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let signInObserver = signInObserver {
            NotificationCenter.default.removeObserver(signInObserver)
        }

        if let signInErrorObserver = signInErrorObserver {
            NotificationCenter.default.removeObserver(signInErrorObserver)
        }
        
        super.viewDidDisappear(animated)
    }

    @IBAction func createAccount(_ sender: Any) {
        let viewControler = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "RegisterViewController")
        present(viewControler, animated: true)
    }

    func showSignInForm() {
        userNameLabel.isHidden = false
        userNameField.isHidden = false
        passwordLabel.isHidden = false
        passwordField.isHidden = false

        guard let window = self.view.window else { fatalError("The view was not in the app's view hierarchy!") }
        (UIApplication.shared.delegate as? AppDelegate)?.accountManager.beginAutoFillAssistedPasskeySignIn(anchor: window)
    }

    func didFinishSignIn(username: String) {
        
        let viewControler = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "UserHomeViewController")
        
        self.view.window?.rootViewController = viewControler
        
        (viewControler as? UserHomeViewController)?.usernameLabel.text = username
    }

    @IBAction func tappedBackground(_ sender: Any) {
        self.view.endEditing(true)
    }
}

