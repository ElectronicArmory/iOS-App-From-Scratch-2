//
//  ViewController.swift
//  RockClimbing
//
//  Created by Electronic Armory on 10/21/19.
//  Copyright © 2019 Electronic Armory. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var fetchResults:[Crag] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let context = DatabaseController.persistentStoreContainer().viewContext
        
//        let newCrag = Crag(context: context)
//        newCrag.cragName = "Another crag location"
//        newCrag.cragNotes = "new notes go here"
//
//        newCrag.cragLocation = ClimbingLocation(context: context)
//        newCrag.cragLocation?.latitude = 123.54
//        newCrag.cragLocation?.longitude = 321.985
//
//        DatabaseController.saveContext()
        
        
        let fetchRequest:NSFetchRequest = Crag.fetchRequest()
        
        do{
            fetchResults = try context.fetch(fetchRequest)
        }
        catch{
            print(error)
        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        LocationController.startMonitoringLocation()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CragCell")
        
        cell?.textLabel?.text = fetchResults[indexPath.row].cragName
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowIndex = indexPath.row
        
        let selectedCrag = fetchResults[rowIndex]
        
        let cragViewController = storyboard?.instantiateViewController(identifier: String(describing: CragViewController.self)) as! CragViewController
        
//        present(cragViewController, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(cragViewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

