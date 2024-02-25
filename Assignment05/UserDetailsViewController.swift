//
//  UserDetailsViewController.swift
//  Assignment05
//
//  Created by Mohamed Shehab on 2/11/24.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    var userDetails: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.nameTextLabel.text = userDetails?.name
        self.emailTextLabel.text = userDetails?.email
        self.ageTextLabel.text = "\(userDetails!.age) years old"
        self.stateTextLabel.text = userDetails?.state
        self.genderTextLabel.text = userDetails?.gender
        self.groupTextLabel.text = userDetails?.group
    }
    
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var emailTextLabel: UILabel!
    @IBOutlet weak var ageTextLabel: UILabel!
    @IBOutlet weak var stateTextLabel: UILabel!
    @IBOutlet weak var genderTextLabel: UILabel!
    @IBOutlet weak var groupTextLabel: UILabel!
   
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        let lables = [nameTextLabel, emailTextLabel, ageTextLabel, stateTextLabel, genderTextLabel, groupTextLabel]
         lables.forEach{$0?.text = ""}
         
         
         let alertController = UIAlertController(title: "Data Deleted", message: "Click the back button to go back.", preferredStyle: .alert)
             alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
             present(alertController, animated: true, completion: nil)
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
