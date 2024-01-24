//
//  Transaction.swift
//  TestProjectScanQr
//
//  Created by MOHAMMADB on 19/01/24.
//

import Foundation
import CoreData

class Transaction: NSManagedObject {
    @NSManaged var transactionId: String
    @NSManaged var amount: Double
    @NSManaged var merchant: String
    @NSManaged var user: UserData
}
