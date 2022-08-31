//
//  MenuVC.swift
//  Sports-Factor
//
//  Created by Демид Стариков on 31.08.2022.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet var upcommingButton: UIButton!
    @IBOutlet var compleatedButton: UIButton!
    @IBOutlet var calendarButton: UIButton!
    @IBOutlet var newsButton: UIButton!
    @IBOutlet var notesButton: UIButton!
    @IBOutlet var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        swipeRecognizer.direction = .left
        view.addGestureRecognizer(swipeRecognizer)
    }
    
    @objc private func handleSwipeGesture(sender: UISwipeGestureRecognizer) {
        dismiss(animated: true)
    }
    
    @IBAction func UpcommingAction(_ sender: UIButton) {

    }
    
    @IBAction func CompleatedAction(_ sender: UIButton) {

    }
    
    @IBAction func CalendarAction(_ sender: UIButton) {

    }
    
    @IBAction func NewsAction(_ sender: UIButton) {

    }
    
    @IBAction func NotesAction(_ sender: UIButton) {
    }
    
    @IBAction func SettingsAction(_ sender: UIButton) {
    }
    
}
