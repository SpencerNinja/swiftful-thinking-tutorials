//
//  BackgroundThreadBootcamp.swift
//  IntermediateBootCamp
//
//  Created by Spencer Hurd on 2/23/22.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func fetchData() {
        
        // download data on a background thread
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("CHECK 1 - On main thread: \(Thread.isMainThread)")
            print("CHECK 1 - Current thread: \(Thread.current)")
            
            // update UI on the main thread
            DispatchQueue.main.async {
                self.dataArray = newData
                print("CHECK 2 - On main thread: \(Thread.isMainThread)")
                print("CHECK 2 - Current thread: \(Thread.current)")
            }
            
        }
        
        let newData = downloadData()
        dataArray = newData
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
    
}

struct BackgroundThreadBootcamp: View {
    
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("LOAD DATA")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct BackgroundThreadBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundThreadBootcamp()
    }
}
