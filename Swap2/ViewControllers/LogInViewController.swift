//
//  LogInViewController.swift
//  Swap2
//
//  Created by Justin Stares on 10/14/20.
//

import UIKit
import FirebaseAuth
import Firebase


class LogInViewController: UIViewController {
    let userDefault = UserDefaults.standard
    let launchedBefore = UserDefaults.standard.bool(forKey: "usersignedin")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //here are some edits
      
        setUpElements()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0; //make it transparent to begin
        
        //Styling elements
        Utilities.styleTextField(emailTextField)
        
        Utilities.styleTextField(passwordTextField)

        Utilities.styleTextField(emailTextField)

        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(loginButton)

    }
    
    
    @IBOutlet weak var emailTextField: UITextField!
    

    @IBOutlet weak var passwordTextField: UITextField!
    

    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    @IBAction func loginTapped(_ sender: Any) {
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // Couldn't sign in
                print("login error")
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                print("login in authenticated here")
                self.userDefault.set(true, forKey: "usersignedin")
                self.userDefault.synchronize()
                
                //mkae database call here
                
//                GlobalVar.Name = firstName + " " + lastName
//                GlobalVar.Number = phoneNumber
//
                let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
                let initViewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "HomeVC") as UIViewController
                self.present(initViewController, animated: true, completion: nil)
                
                

            }
        }
    }
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
