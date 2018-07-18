//
//  PrivacyModel.swift
//  FBSnapshotTestCase
//
//  Created by Jacob Fielding on 7/18/18.
//

import Foundation
import CoreData

class PrivacyModel {
    
    /** Core Data Specifications */
    lazy var managedObjectModel: NSManagedObjectModel = {
        let privacyKitBundle = Bundle(identifier: "com.ithazfire.PrivacyKit")
        
        let modelURL = privacyKitBundle!.url(forResource: "Privacy", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    fileprivate var privacy: Privacy?
    
    /** Data Keys */
    var privacyAccepted: Bool = false
    
    init() {
        
    }
    
    func buildDefaults() {
        
    }
    
    func fetch() {
        
    }
    
    func save() {
        privacy?.setValue(privacyAccepted, forKey: "privacyAccepted")
        
        do {
            //
        } catch {
            
        }
    }
}
