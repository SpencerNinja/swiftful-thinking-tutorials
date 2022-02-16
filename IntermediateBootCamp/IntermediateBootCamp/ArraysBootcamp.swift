//
//  ArraysBootcamp.swift
//  IntermediateBootCamp
//
//  Created by Spencer Hurd on 2/16/22.
//

import SwiftUI
import CoreMIDI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        
        // SORT - long method of writing:
//        filteredArray = dataArray.sorted { (user1, user2) in
//            return user1.points > user2.points
//        }
        
        // SORT - short method of writing:
//        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
        
        //---------------------------------------------------------------
        
        // FILTER - long method of writing:
//        filteredArray = dataArray.filter({ (user) -> Bool in
////            return user.points > 50       // Users more than 50 points
////            return user.name.contains("i")  // Users that have an 'i' in their name
//            return user.isVerified        // Verified users
//        })
        
        // FILTER - short method of writing:
//        filteredArray = dataArray.filter({ $0.isVerified })
        
        //---------------------------------------------------------------
        
        // MAP (.map) - long method of writing (Includes users with name set as nil, but sets name to "ERROR"):
//        mappedArray = dataArray.map({ (user) -> String in
//            return user.name ?? "ERROR"
//        })
        
        // MAP (.map) - short method of writing:
//        mappedArray = dataArray.map({ $0.name })
        
        // MAP (.compactMap) - alternate method of writing if name is Optional (Doesn't include users with name set as nil):
//        mappedArray = dataArray.compactMap({ (user) -> String? in
//            return user.name
//        })
        
        // MAP (.compactMap) - short method of writing:
//        mappedArray = dataArray.compactMap({ $0.name })
        
        //---------------------------------------------------------------
        
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .compactMap({ $0.name })
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Spence", points: 5, isVerified: true)
        let user2 = UserModel(name: "Winston", points: 71, isVerified: true)
        let user3 = UserModel(name: "Pen", points: 2, isVerified: false)
        let user4 = UserModel(name: "Archimedes", points: 35, isVerified: true)
        let user5 = UserModel(name: "DarkStar", points: 87, isVerified: true)
        let user6 = UserModel(name: "Kenobi", points: 34, isVerified: true)
        let user7 = UserModel(name: nil, points: 55, isVerified: false)
        let user8 = UserModel(name: "Matches", points: 76, isVerified: true)
        let user9 = UserModel(name: "Evelyn", points: 98, isVerified: true)
        let user10 = UserModel(name: "Naomi", points: 23, isVerified: false)
        let user11 = UserModel(name: "Crimson", points: 43, isVerified: true)
        let user12 = UserModel(name: "Azalea", points: 65, isVerified: true)
        let user13 = UserModel(name: nil, points: 13, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
            user11,
            user12,
            user13
        ])
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                
                // Loop for Sort and Filter
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.green.cornerRadius(10))
//                    .padding(.horizontal)
//                }
                
                // Loop for Map
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
            }
        }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
