//
//  SortSelectionViewController.swift
//  Assignment05
//
//  Created by Mohamed Shehab on 2/11/24.
//

import UIKit

class SortSelectionViewController: UIViewController {
    
    var sortSelectionDelegate: SortSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nameASCSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 1)
        dismiss(animated: true)
    }
    
    @IBAction func nameDECSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 2)
        dismiss(animated: true)
    }
    
    @IBAction func emailASCSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 3)
        dismiss(animated: true)
    }
    
    @IBAction func emailDECSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 4)
        dismiss(animated: true)
    }
    
    @IBAction func genderASCSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 5)
        dismiss(animated: true)
    }
    
    @IBAction func genderDECSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 6)
        dismiss(animated: true)
    }
  
    @IBAction func ageSCSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 7)
        dismiss(animated: true)
    }
    
    @IBAction func ageDECSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 8)
        dismiss(animated: true)
    }
    
    @IBAction func stateASCSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 9)
        dismiss(animated: true)
    }
    
    @IBAction func stateDECSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 10)
        dismiss(animated: true)
    }
    
    @IBAction func groupASCSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 11)
        dismiss(animated: true)
    }
    
    @IBAction func groupDECSortButton(_ sender: Any) {
        self.sortSelectionDelegate?.sendBackSortedData(data: 12)
        dismiss(animated: true)
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
