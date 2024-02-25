//
//  SelectGenderViewController.swift
//  Assignment05
//
//  Created by Mohamed Shehab on 2/11/24.
//

import UIKit

class SelectGenderViewController: UIViewController {
//    var data = Data()
//    var users = [User]()
    var dataBackDelegate: DataBackDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension SelectGenderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.genders.count // or data.states.count, depending on the table view
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genderViewCell", for: indexPath)
        let gender = Data.genders[indexPath.row] // or data.states[indexPath.row], depending on the table view
        cell.textLabel?.text = gender
        return cell
    }
}


extension SelectGenderViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choice = Data.genders[indexPath.row]
        let user = User(gender: choice)
        self.dataBackDelegate?.sendBackGenderData(user: user)
        dismiss(animated: true)
    }
    
}
