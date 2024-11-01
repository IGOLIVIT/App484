//
//  HomeViewModel.swift
//  App484
//
//  Created by IGOR on 30/10/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @Published var search: String = ""

    @AppStorage("ObAmount") var ObAmount: Int = 0
    @AppStorage("Earning") var Earning: Int = 0
    @AppStorage("Expenses") var Expenses: Int = 0
    @AppStorage("Persons") var Persons: Int = 0
    @AppStorage("positive") var positive: Int = 0
    @AppStorage("negative") var negative: Int = 0

    @Published var images: [String] = ["h1", "h2"]
    @Published var currentImage: String = ""
    
    @Published var statuses: [String] = ["Available", "Rented"]
    @Published var currentStatus: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isAddTopDocs: Bool = false
    @Published var isAddOtherDoc: Bool = false

    @Published var obPType: String = ""
    @Published var obStatus: String = ""
    @Published var obLoc: String = ""
    @Published var obImage: String = ""
    @Published var obDescr: String = ""
    @Published var obMonRent: String = ""
    @Published var obLT: String = ""
    @Published var obSize: String = ""
    @Published var obBath: String = ""
    @Published var obBed: String = ""

    @Published var objects: [ObjectModel] = []
    @Published var selectedObject: ObjectModel?

    func addObject() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ObjectModel", into: context) as! ObjectModel

        loan.obPType = obPType
        loan.obStatus = obStatus
        loan.obLoc = obLoc
        loan.obImage = obImage
        loan.obDescr = obDescr
        loan.obMonRent = obMonRent
        loan.obLT = obLT
        loan.obSize = obSize
        loan.obBath = obBath
        loan.obBed = obBed

        CoreDataStack.shared.saveContext()
    }

    func fetchObjects() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ObjectModel>(entityName: "ObjectModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.objects = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.objects = []
        }
    }
    
    func fetchObjectssBySearch() -> [ObjectModel] {
        
        return objects.isEmpty ? objects : search.isEmpty ? objects : objects.filter{($0.obPType ?? "").lowercased().contains(search.lowercased())}
    }
}
