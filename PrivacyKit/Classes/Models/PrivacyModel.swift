//
//  PrivacyModel.swift
//  FBSnapshotTestCase
//
//  Created by Jacob Fielding on 7/18/18.
//

import Foundation
import CoreData

class PrivacyModel {
    
    /** Core Data Stack */
    fileprivate let context = CoreDataStack.managedObjectContext
    fileprivate var privacy: Privacy?
    
    /** Data Keys */
    var privacyAccepted: Bool = false
    
    init() {
        
    }
    
    func buildDefaults() {
        guard let entity = NSEntityDescription.entity(forEntityName: "Privacy", in: context) else {
            print("PrivacyModel: Error creating build entity")
            return
        }
        
        if let current = self.fetch() {
            /** Already Built */
            return
        }
        
        privacy = NSManagedObject(entity: entity, insertInto: context) as! Privacy
        privacy?.setValue(privacyAccepted, forKey: "privacyAccepted")
        do {
            try context.save()
        } catch {
            print("PrivacyModel: Error saving initial build context")
        }
    }
    
    func fetch() -> Privacy? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Privacy")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            
            if let row = result.first {
                let privacy = row as! Privacy
                privacyAccepted = privacy.value(forKey: "privacyAccepted") as! Bool
                return privacy
            }
        } catch {
            print("PrivacyModel: Failed to request context")
        }
        
        return nil
    }
    
    func save() {
        privacy?.setValue(privacyAccepted, forKey: "privacyAccepted")
        
        do {
            try context.save()
        } catch {
            print("PrivacyModel: Error saving context")
        }
    }
}
