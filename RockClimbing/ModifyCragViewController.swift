//
//  ModifyCragViewController.swift
//  RockClimbing
//
//  Created by Electronic Armory on 1/1/20.
//  Copyright © 2020 Electronic Armory. All rights reserved.
//

import UIKit

class ModifyCragViewController: UIViewController {

    @IBOutlet weak var cragNameTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    @IBOutlet weak var cragNotesTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped(sender:)))
    }
    

    
    @objc
    func saveTapped(sender:UIBarButtonItem){
        if let context = DatabaseController.persistentContainer?.viewContext {
        
            let newCrag = Crag(context: context)
          
            newCrag.cragName = cragNameTextField.text
            newCrag.cragNotes = cragNotesTextView.text

            newCrag.cragLocation = ClimbingLocation(context: context)
            newCrag.cragLocation?.latitude = Double(latitudeTextField.text!)!
            newCrag.cragLocation?.longitude = Double(longitudeTextField.text!)!

            DatabaseController.saveContext()
            
            navigationController?.popViewController(animated: true)
        }
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
