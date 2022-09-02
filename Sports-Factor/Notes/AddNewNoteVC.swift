//
//  AddNewNoteVC.swift
//  Sports-Factor
//
//  Created by Демид Стариков on 01.09.2022.
//

import UIKit

class AddNewNoteVC: UIViewController {
    
    @IBOutlet var noteLabel: UILabel!
    @IBOutlet var noteText: UITextView!
    
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var addButton: UIButton!
    
    weak var delegate: NoteCollectionVC?
    
    var index = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteLabel.text = "Note \(index)"
    }
    @IBAction func closeAction(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        dismiss(animated: true)
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        index += 1
        
        let newNoteLabel = noteLabel.text!
        let newNoteText = noteText.text!
        
        delegate?.arrayUpdate(newNoteLabel: newNoteLabel, newNoteText: newNoteText)
        print("addnew: \(newNoteLabel) \(newNoteText)")
        dismiss(animated: true)
    }
}
