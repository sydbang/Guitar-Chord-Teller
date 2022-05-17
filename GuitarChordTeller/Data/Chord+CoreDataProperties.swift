//
//  Chord+CoreDataProperties.swift
//  
//
//  Created by Sunghee Bang on 2022-05-17.
//
//

import Foundation
import CoreData


extension Chord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Chord> {
        return NSFetchRequest<Chord>(entityName: "Chord")
    }

    @NSManaged public var name: String

}
