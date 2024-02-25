//
//  SelectAgeViewController.swift
//  Assignment05
//
//  Created by Mohamed Shehab on 2/11/24.
//

import UIKit

class SelectAgeViewController: UIViewController {
    var ages = [Int]()
    var dataBackDelegate: DataBackDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Populate the ages array from 18 to 64
        for age in 18...100 {
            ages.append(age)
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
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

extension SelectAgeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ageViewCell", for: indexPath)
        let age = ages[indexPath.row]
        cell.textLabel?.text = String(age)
        return cell
    }
}

extension SelectAgeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choice = ages[indexPath.row]
        let user = User(age: choice)
        self.dataBackDelegate?.sendBackAgeData(user: user)
        dismiss(animated: true)
    }
}
