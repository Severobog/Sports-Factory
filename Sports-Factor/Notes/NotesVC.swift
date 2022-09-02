//
//  NotesVC.swift
//  Sports-Factor
//
//  Created by Демид Стариков on 31.08.2022.
//

import UIKit

class NotesVC: UIViewController {

    @IBOutlet var addButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addNote(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
    }
    
}
