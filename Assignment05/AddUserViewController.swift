//
//  AddUserViewController.swift
//  Assignment05
//
//  Created by Mohamed Shehab on 2/11/24.
//

import UIKit

protocol DataBackDelegate {
    func sendBackGenderData(user: User)
    func sendBackAgeData(user: User)
    func sendBackStateData(user: User)
    func sendBackGroupData(user: User)
}

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
    @IBOutlet weak var stateTextField: UILabel!
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
        
        if let usersViewController = presentingViewController as? UsersViewController {
            usersViewController.users.append(userToAdd)
            usersViewController.userTableView.reloadData()
        } else {
            print("Failed to find UsersViewController as presenting view controller.")
        }
        
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGenderSegue" {
            if let vc = segue.destination as? SelectGenderViewController {
                vc.dataBackDelegate = self
            }
        } else if segue.identifier == "toAgeSegue" {
            if let vc = segue.destination as? SelectAgeViewController {
                vc.dataBackDelegate = self
            }
        } else if segue.identifier == "toStateSegue" {
            if let vc = segue.destination as? SelectStateViewController {
                vc.dataBackDelegate = self
            }
        } else if segue.identifier == "toGroupSegue" {
            if let vc = segue.destination as? SelectGroupViewController {
                vc.dataBackDelegate = self
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

extension AddUserViewController: DataBackDelegate {
    func sendBackGenderData(user: User) {
        self.genderTextField.text = user.gender
        self.userToAdd.gender = user.gender
    }
    
    func sendBackAgeData(user: User) {
        self.ageTextField.text = "\(user.age) years old"
        self.userToAdd.age = user.age
    }
    
    func sendBackStateData(user: User) {
        self.stateTextField.text = user.state
        self.userToAdd.state = user.state
    }
    
    func sendBackGroupData(user: User) {
        self.groupTextField.text = user.group
        self.userToAdd.group = user.group
    }
}
