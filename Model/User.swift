//
//  User.swift
//  TestProjectScanQr
//
//  Created by MOHAMMADB on 19/01/24.
//

import Foundation
import CoreData

class UserData: NSManagedObject {
    @NSManaged var userId: String
    @NSManaged var balance: Double
    @NSManaged var transaction: Set<Transaction>
}
