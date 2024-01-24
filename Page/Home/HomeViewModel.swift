//
//  HomeViewModel.swift
//  TestProjectScanQr
//
//  Created by MOHAMMADB on 22/01/24.
//

import Foundation


class HomeViewModel {
    
    var user : UserData!
    var coreDataManager = CoreDataManager.shared
    var transactionHistory : [Transaction] = []
    
    
    func getUser() {
       user = coreDataManager.getUser(userId: BASEUSERID)
    }
    
    func getTransaction(user: UserData){
        let transaction = coreDataManager.getTransactions(user: user)
        var array = [Transaction]()
        for i in transaction {
            array.append(i)
        }
        transactionHistory = array
    }
}
