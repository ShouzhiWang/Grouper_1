//
//  HistoryDataMgr.swift
//  Grouper
//
//  Created by 王首之 on 2021/12/5.
//

import Foundation
import CoreData

class HistoryDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init () {
        persistentContainer = NSPersistentContainer(name: "UserData")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store Failed \(error.localizedDescription)")
            }
        }
    }
    
    func updateHistory() {
        do{
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("failed to save context \(error)")
        }
    }
    
    func deleteHistory(person: History) {
        persistentContainer.viewContext.delete(person)
        
        do{
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("failed to save context \(error)")
        }
        
        
    }
    
    func getAllHistory() -> [History] {
        let fetchRequest: NSFetchRequest<History> = History.fetchRequest()
        
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch{
            return []
        }
    }
    
    func savePerson(igroup: String, members: [String]) {
        let currentdate = Date()
        
        let history = History(context: persistentContainer.viewContext)
        history.time = currentdate
        history.pInGroup = igroup
        history.members = members
        
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save person \(error)")
        }
    }
    
    
}
