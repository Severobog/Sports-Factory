//
//  NoteCell.swift
//  Sports-Factor
//
//  Created by Демид Стариков on 01.09.2022.
//

import UIKit

class NoteCell: UICollectionViewCell {
    
    @IBOutlet var noteLabel: UILabel!
    
    var note: NewNote? {
        didSet {
            noteLabel.text = note?.mainLabel
        }
    }
}
