//
//  UpcommingVC.swift
//  Sports-Factor
//
//  Created by Демид Стариков on 31.08.2022.
//

import UIKit

class UpcommingVC: UIViewController {

    @IBOutlet var sportsSegmentedControll: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func FootballOrHockey(_ sender: UISegmentedControl) {
        AppDelegate.shared.playAudioFile()
    }
}
