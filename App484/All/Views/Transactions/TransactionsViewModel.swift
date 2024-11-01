//
//  TransactionsViewModel.swift
//  App484
//
//  Created by IGOR on 31/10/2024.
//

import SwiftUI
import CoreData

final class TransactionsViewModel: ObservableObject {
    
    @Published var search: String = ""
    
    @Published var int1: String = String(format: "%.f", Double(.random(in: 1...7)))
    @Published var int2: String = String(format: "%.f", Double(.random(in: 0...7)))

    @AppStorage("ObAmount") var ObAmount: Int = 0
    @AppStorage("Earning") var Earning: Int = 0
    @AppStorage("Expenses") var Expenses: Int = 0
    @AppStorage("Persons") var Persons: Int = 0
    @AppStorage("positive") var positive: Int = 0
    @AppStorage("negative") var negative: Int = 0
    
    @Published var pairs: [String] = ["EUR:CHF", "EUR:JPY", "EUR:USD", "GBP:AUD", "GBP:JPY", "GBP:USD", "USD:CAD", "USD:CHF"]
    @Published var currencies: [String] = ["CHF", "JPY", "USD", "GBP", "AUD", "CAD"]
    @AppStorage("curCurrency") var curCurrency = ""

    @Published var images: [String] = ["h1", "h2"]
    @Published var currentImage: String = ""
    
    @Published var types: [String] = ["Positive", "Negative"]
    @Published var currentType: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isPairs: Bool = false
    @Published var isGraph: Bool = false

    @Published var trTitle: String = ""
    @Published var trDescr: String = ""
    @Published var trAmount: String = ""
    @Published var trType: String = ""

    @Published var transactions: [TransModel] = []
    @Published var selectedTrans: TransModel?

    func addTrans() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TransModel", into: context) as! TransModel

        loan.trTitle = trTitle
        loan.trDescr = trDescr
        loan.trAmount = trAmount
        loan.trType = trType

        CoreDataStack.shared.saveContext()
    }

    func fetchTranss() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TransModel>(entityName: "TransModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.transactions = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.transactions = []
        }
    }
    
    func fetchTransactionsBySearch() -> [TransModel] {
        
        return transactions.isEmpty ? transactions : search.isEmpty ? transactions : transactions.filter{($0.trTitle ?? "").lowercased().contains(search.lowercased())}
    }
}
