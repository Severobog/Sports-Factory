//
//  NoteCollectionViewController.swift
//  Sports-Factor
//
//  Created by Демид Стариков on 01.09.2022.
//

import UIKit
import CoreData

protocol NoteCollectionVCDelegate: AnyObject {
    
    func arrayUpdate(newNoteLabel: String, newNoteText: String)
}

final class NoteCollectionVC: UICollectionViewController, NoteCollectionVCDelegate {
    
    struct Constants {
        static let entity = "NewNote"
        static let sortName = "mainLabel"
        static let cellName = "cell"
    }
    
    var fetchResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.entity)
        let sortDesriptor = NSSortDescriptor(key: Constants.sortName, ascending:  true)
        fetchRequest.sortDescriptors = [sortDesriptor]
        let fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataManager.instance.context, sectionNameKeyPath: nil, cacheName: nil)
        
        return fetchResultController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NewNote")
        do {
            try fetchResultController.performFetch()
        } catch {
             print(error)
        }
//        do {
//                   try fetchResultController.performFetch()
//               } catch {
//                    print(error)
//               }
//
//               do {
//                   let results = try CoreDataManager.instance.context.fetch(fetchRequest)
//                   for result in results as! [NSManagedObject] {
//                       CoreDataManager.instance.context.delete(result)
//                       print("удаляем элемент")
//                       CoreDataManager.instance.saveContext()
//                   }
//               } catch {
//                   print(error)
//               }
//
//               do {
//                   try fetchResultController.performFetch()
//               } catch {
//                    print(error)
//               }
//
//               CoreDataManager.instance.saveContext()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddNewNoteVC else { return }
        print("проходите")
            destination.delegate = self
    }
        

    
    func arrayUpdate(newNoteLabel: String, newNoteText: String) {
        print("есть контакт")
        let newObj = NewNote()
        
        newObj.mainLabel = newNoteLabel
        newObj.text = newNoteText
        
        collectionView.reloadData()
        
        do {
            
            try fetchResultController.performFetch()
            
        } catch {
            
            print(error)
            
        }
    
        CoreDataManager.instance.saveContext()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchResultController.sections?.count ?? 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let sections = fetchResultController.sections {
            return sections[section].numberOfObjects
        } else {
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let noteCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellName, for: indexPath) as? NoteCell {
            
            let newNote = fetchResultController.object(at: indexPath) as! NewNote
            
            noteCell.note = newNote
            
            return noteCell
            }
        
    return UICollectionViewCell()
    }
}

