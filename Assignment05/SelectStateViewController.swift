//
//  SelectStateViewController.swift
//  Assignment05
//
//  Created by Mohamed Shehab on 2/11/24.
//

import UIKit

class SelectStateViewController: UIViewController {
    
    var dataBackDelegate: DataBackDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true)
    }

}

extension SelectStateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.states.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateViewCell", for: indexPath)
        let state = Data.states[indexPath.row]
        cell.textLabel?.text = state
        return cell
    }
}

extension SelectStateViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choice = Data.states[indexPath.row]
        let user = User(state: choice)
        self.dataBackDelegate?.sendBackStateData(user: user)
        dismiss(animated: true)
    }
    
}
