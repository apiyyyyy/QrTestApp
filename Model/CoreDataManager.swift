//
//  CoreDataManager.swift
//  TestProjectScanQr
//
//  Created by MOHAMMADB on 19/01/24.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BankingData")
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                print("Error Container = \(error)")
            }
        }
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    
    //MARK: - Save Data
    func saveData() {
        
        if context.hasChanges {
            do {
                try context.save()
            }catch {
                let error = error as NSError
                print("Error Save Data \(error)")
            }
        }
    }
    
    //MARK: - User Management
    func createUser(userId: String, initialBalance: Double) {
        let userData = UserData(context: context)
        
        userData.userId = userId
        userData.balance = initialBalance
        saveData()
    }
    
    func getUser(userId: String) -> UserData? {
        let fetchRequest: NSFetchRequest<UserData> = UserData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userId == %@", userId)
        
        do{
            let users = try! context.fetch(fetchRequest)
            print("user data \(users.first!)")
            return users.first
        }catch {
            print("Error Fetching User \(error)")
            return nil
        }
    }
    
    func createTransaction(user:UserData, amount: Double, merchant: String, date:Date){
        
        let newTransaction = Transaction(context: context)
        newTransaction.transactionId = UUID().uuidString
        newTransaction.amount = amount
        newTransaction.merchant = merchant
        newTransaction.date = date
        newTransaction.userData = user
        saveData()
    }
    
    func getTransactions(user:UserData) -> [Transaction] {
        let fetchRequest: NSFetchRequest<Transaction> = Transaction.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userData == %@", user)
        
        let sortTransaction = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortTransaction]
        
        do{
            let usersTransaction = try! context.fetch(fetchRequest)
            return usersTransaction
        }catch {
            print("Error Fetching User \(error)")
            return []
        }
    }
}


//MARK: - USERID

let BASEUSERID = "testUser123"
