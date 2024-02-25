//
//  AddUserViewController.swift
//  Assignment05
//
//  Created by Mohamed Shehab on 2/11/24.
//

import UIKit

class AddUserViewController: UIViewController {
    
    var userToAdd: User = User()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderTextField: UILabel!
    @IBOutlet weak var ageTextField: UILabel!
    @IBOutlet weak var sateTextField: UILabel!
    @IBOutlet weak var groupTextField: UILabel!
    
    
    @IBAction func submitButtonAction(_ sender: Any) {
        
        // prepare users
        let name = self.nameTextFiled.text ?? ""
        let email = self.emailTextField.text ?? ""
        let gender = self.userToAdd.gender 
        let age = self.userToAdd.age 
        let state = self.userToAdd.state 
        let group = self.userToAdd.group 
        self.userToAdd = User(
            name: name,
            email: email,
            gender: gender,
            age: age,
            state: state,
            group: group
        )
        
        if let usersViewController = presentedViewController as? UsersViewController {
            usersViewController.users.append(userToAdd)
            usersViewController.userTableView.reloadData()
        } else {
            print("Failed to find UsersViewController as presenting view controller.")
        }
        
        dismiss(animated: true)
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
