//
//  UsersViewController.swift
//  Assignment05
//
//  Created by Mohamed Shehab on 2/11/24.
//

import UIKit

protocol SortSelectionDelegate: AnyObject {
    func sendBackSortedData(data: Int)
}

// protocol for deleting user
protocol UserDeleteDelegate: AnyObject {
    func deleteUser(indexPath: IndexPath)
}

class UsersViewController: UIViewController {
    var users = [User]() // Array to store user data
    var propagatedUser = User()   // Variable to hold a user task
    var people = [       // Array of sample user data
        (name: "Shaikh Islam", email: "shaikh@islam.com", gender: "Male", age: 29, state: "Washington", group: "Coworker"),
       (name: "Tom Brown", email: "t@t.com", gender: "Male", age: 22, state: "North Carolina", group: "Classmate")
    ]
    
    weak var sortSelectionDelegate: SortSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUsers()
    }

    @IBOutlet weak var userTableView: UITableView! // Table view for displaying users
    
    func setupUsers() {
        for person in people {
            let user = User(
                name: person.name,
                email: person.email,
                gender: person.gender,
                age: person.age,
                state: person.state,
                group: person.group
            )
            users.append(user)
        }
        userTableView.reloadData()
    }
    
    @IBAction func clearAllButtonAction(_ sender: Any) {
        users.removeAll()
        userTableView.reloadData()
        let alertController = UIAlertController(
            title: "All of the Data are removed",
            message: "You can close the app now.",
            preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil)
            )
        present(alertController, animated: true, completion: nil)
    }
    
    // prepare for the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sortSegue" {
            if let vc = segue.destination as? SortSelectionViewController {
//                vc.sortSelectionDelegate = self
            }
        } else if segue.identifier == "toUserDetailsSegue" {
            if let indexPath = userTableView.indexPathForSelectedRow {
                let selectedUser = users[indexPath.row]
                let destination = segue.destination as! UserDetailsViewController
                destination.userDetails = selectedUser
                destination.currentUserIndex = indexPath
                destination.deleteDelegate = self
            }
        }
    }
    
    @IBOutlet weak var sortTextLabel: UILabel!
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "myUserBoardCell", for: indexPath)
        
        let user = users[indexPath.row]
        // Display user data in the cell
        let nameLable = cell.viewWithTag(100) as! UILabel
        let emailLable = cell.viewWithTag(200) as! UILabel
        let ageLable = cell.viewWithTag(300) as! UILabel
        let stateLable = cell.viewWithTag(400) as! UILabel
        let genderLable = cell.viewWithTag(500) as! UILabel
        let groupLable = cell.viewWithTag(600) as! UILabel

        nameLable.text = user.name
        emailLable.text = user.email
        genderLable.text = user.gender
        ageLable.text = "\(user.age) years old"
        stateLable.text = user.state
        groupLable.text = user.group
        return cell
    }
    
    
}

//extension UsersViewController: SortSelectionDelegate {
//    func sendBackSortedData(data: Int) {
//        // Dictionary to map data values to sorting closures
//        let sortingClosures: [Int: (User, User) -> Bool] = [
//            1: { $0.name! < $1.name! },     // Sort by Name (ASC)
//            2: { $0.name! > $1.name! },     // Sort by Name (desc)
//            3: { $0.email! < $1.email! },   // Sort by Email (ASC)
//            4: { $0.email! > $1.email! },   // Sort by Email (desc)
//            5: { $0.gender! < $1.gender! }, // Sort by Gender (ASC)
//            6: { $0.gender! > $1.gender! }, // Sort by Gender (desc)
//            7: { $0.age < $1.age },         // Sort by Age (ASC)
//            8: { $0.age > $1.age },         // Sort by Age (desc)
//            9: { $0.state! < $1.state! },   // Sort by State (ASC)
//            10: { $0.state! > $1.state! },  // Sort by State (desc)
//            11: { $0.group! < $1.group! },  // Sort by Group (ASC)
//            12: { $0.group! > $1.group! }   // Sort by Group (desc)
//        ]
//        
//        // Sort users array using the selected sorting closure
//        if let sortingClosure = sortingClosures[data] {
//            users.sort(by: sortingClosure)
//            UserTableView.reloadData()
//        }
//    }
//}

// touching the UITable, what will happen?
extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        propagatedUser = selectedUser
        print(selectedUser)
        performSegue(withIdentifier: "toUserDetailsSegue", sender: nil)
    }
}

// data deletion delegate
extension UsersViewController: UserDeleteDelegate {
    func deleteUser(indexPath: IndexPath) {
        print("removing user with row \(indexPath.row)")
        users.remove(at: indexPath.row)
        userTableView.reloadData()
    }
}
