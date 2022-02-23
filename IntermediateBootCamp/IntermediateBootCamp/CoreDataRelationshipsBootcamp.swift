//
//  CoreDataRelationshipsBootcamp.swift
//  IntermediateBootCamp
//
//  Created by Spencer Hurd on 2/22/22.
//

import SwiftUI
import CoreData

/*
 Three entities:
    1 - BusinessEntity
    2 - DepartmentEntity
    3 - EmployeeEntity
 */

class CoreDataManager {
    
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Saved successfully.")
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
}

class CoreDataRelationshipViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    @Published var businesses: [BusinessEntity] = []
    @Published var departments: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        let sort = NSSortDescriptor(keyPath: \BusinessEntity.name, ascending: true)
        request.sortDescriptors = [sort]
        
        // Filter to only show Apple business
//        let filter = NSPredicate(format: "name == %@", "Apple")
//        request.predicate = filter
        
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            departments = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getEmployees(forBusiness business: BusinessEntity) {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        let filter = NSPredicate(format: "business == %@", business)
        request.predicate = filter
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func updateBusiness() {
        
        let existingBusiness = businesses[2] // Update Facebook
        existingBusiness.addToDepartments(departments[1]) // add Engineering department
        save()
        
    }
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
//        newBusiness.name = "Apple"
//        newBusiness.name = "Microsoft"
        newBusiness.name = "Facebook"
        
        // Add existing departments to the new business
//        newBusiness.departments = [departments[0], departments[1]]
        
        // Add existing employees to the new business
//        newBusiness.employees = [employees[1]]
        
        // Add new business to existing department
//        newBusiness.addToDepartments(<#T##value: DepartmentEntity##DepartmentEntity#>)
        
        // Add new business to existing employee
//        newBusiness.addToEmployees(<#T##value: EmployeeEntity##EmployeeEntity#>)
        
        save()
    }
    
    func addDepartment() {
        let newDepartment = DepartmentEntity(context: manager.context)
//        newDepartment.name = "Marketing"
//        newDepartment.businesses = [businesses[0]]
        
//        newDepartment.name = "Engineering"
//        newDepartment.employees = [employees[1]]
//        newDepartment.addToEmployees(employees[1]) // add Evelyn to Engineering department
        
        newDepartment.name = "Finance"
        newDepartment.businesses = [businesses[0], businesses[1], businesses[2]]
        newDepartment.addToEmployees(employees[1]) // add Evelyn to Finance department
        
        save()
    }
    
    func addEmployee() {
        let newEmployee = EmployeeEntity(context: manager.context)
        
//        newEmployee.age = 32
//        newEmployee.dateJoined = Date()
//        newEmployee.name = "Spencer"
//        newEmployee.business = businesses[0]
//        newEmployee.department = departments[0]
        
//        newEmployee.age = 25
//        newEmployee.dateJoined = Date()
//        newEmployee.name = "Evelyn"
        
        newEmployee.age = 87
        newEmployee.dateJoined = Date()
        newEmployee.name = "Aragorn"
        newEmployee.business = businesses[2] // Add Aragorn to Facebook business
        newEmployee.department = departments[1] // Add Aragorn to Engineering department
        

        save()
    }
    
    func deleteDepartment() {
        // Delete a department
        let department = departments[1]
        manager.context.delete(department)
        save()
    }
    
    func save() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        }
    }
    
}

struct CoreDataRelationshipsBootcamp: View {
    
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Button(action: {
                        vm.deleteDepartment()
//                        vm.getEmployees(forBusiness: vm.businesses[0])
                    }, label: {
                        Text("Perform Action")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    })
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(vm.businesses) { business in
                                BusinessView(entity: business)
                            }
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(vm.departments) { department in
                                DepartmentView(entity: department)
                            }
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(vm.employees) { employee in
                                EmployeeView(entity: employee)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

struct CoreDataRelationshipsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataRelationshipsBootcamp()
    }
}

struct BusinessView: View {
    
    let entity: BusinessEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments:")
                    .bold()
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
            }
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees:")
                    .bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct DepartmentView: View {
    
    let entity: DepartmentEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
                Text("Businesses:")
                    .bold()
                ForEach(businesses) { business in
                    Text(business.name ?? "")
                }
            }
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees:")
                    .bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                }
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.green.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct EmployeeView: View {
    
    let entity: EmployeeEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            Text("Age: \(entity.age)")
            Text("Date joined: \(entity.dateJoined ?? Date())")
            
            Text("Business:")
                .bold()
            
            Text(entity.business?.name ?? "")
            
            Text("Department:")
                .bold()
            
            Text(entity.department?.name ?? "")
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(Color.blue.opacity(0.5))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
