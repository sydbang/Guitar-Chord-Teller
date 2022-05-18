//
//  Chord+CoreDataProperties.swift
//  
//
//  Created by Sunghee Bang on 2022-05-18.
//
//

import Foundation
import CoreData


extension Chord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Chord> {
        return NSFetchRequest<Chord>(entityName: "Chord")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String
    @NSManaged public var stringScaleIndex: [Int]?
    @NSManaged public var fretPressedIndex: [Int]?
    @NSManaged public var stringsEnabled: NSObject?

}
