/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The user's home view.
*/

import UIKit

class UserHomeViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBAction func signOut(_ sender: Any) {
        self.view.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "SignInViewController")
    }
}
