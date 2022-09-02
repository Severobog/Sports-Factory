//
//  AddNewNoteSubVC.swift
//  Sports-Factor
//
//  Created by Демид Стариков on 01.09.2022.
//

import UIKit

protocol AddNewNoteSubVCDelegate {
    
    func arrayUpdate(newNoteLabel: String, newNoteText: String)
}

class AddNewNoteSubVC: UIViewController, AddNewNoteSubVCDelegate {
    
    weak var delegate: NoteCollectionVC?
    
    func arrayUpdate(newNoteLabel: String, newNoteText: String) {
        delegate?.arrayUpdate(newNoteLabel: newNoteLabel, newNoteText: newNoteText)
        print("addnewSub: \(newNoteLabel) \(newNoteText)")
        
    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let destination = segue.destination as? AddNewNoteVC else { return }
//            destination.delegate = self
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
