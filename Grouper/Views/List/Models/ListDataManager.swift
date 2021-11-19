//
//  ListDataManager.swift
//  Grouper
//
//  Created by 王首之 on 2021/11/8.
//

import Foundation
import CoreData

class ListDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init () {
        persistentContainer = NSPersistentContainer(name: "UserData")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store Failed \(error.localizedDescription)")
            }
        }
    }
    
    func updatePerson() {
        do{
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("failed to save context \(error)")
        }
    }
    
    func deletePerson(person: People) {
        persistentContainer.viewContext.delete(person)
        
        do{
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("failed to save context \(error)")
        }
        
        
    }
    
    func getAllPeople() -> [People] {
        let fetchRequest: NSFetchRequest<People> = People.fetchRequest()
        
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch{
            return []
        }
    }
    
    func savePerson(name: String, role: String, group: String, descrip: String, personality: String, picturen: String) {
        
        let people = People(context: persistentContainer.viewContext)
        people.name = name
        people.role = role
        people.group = group
        people.descrip = descrip
        people.personality = personality
        people.picturen = picturen
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save person \(error)")
        }
    }
    
    
}
