//
//  GroupDataManager.swift
//  Grouper
//
//  Created by 王首之 on 2021/11/12.
//

import Foundation
import CoreData

class GroupDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init () {
        persistentContainer = NSPersistentContainer(name: "UserData")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store Failed \(error.localizedDescription)")
            }
        }
    }
    
    func saveGroup(name: String, participant: String) {
        let group = Groups(context: persistentContainer.viewContext)
        group.name = name
        group.participants! += participant
        
        do {
            try persistentContainer.viewContext.save() 
        } catch {
            print("Failed to save group \(error)")
        }
    
    }
    
    func getAllGroup() -> [Groups] {
        let fetchRequest: NSFetchRequest<Groups> = Groups.fetchRequest()
        
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch{
            return []
        }
    }
    
    func updateGroup() {
        do{
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("failed to save context \(error)")
        }
    }
    
    func deleteGroup(group: Groups) {
        persistentContainer.viewContext.delete(group)
        
        do{
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("failed to save context \(error)")
        }
        
        
    }
    
}
