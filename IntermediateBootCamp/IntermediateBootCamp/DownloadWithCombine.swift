//
//  DownloadWithCombine.swift
//  IntermediateBootCamp
//
//  Created by Spencer Hurd on 2/24/22.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        /* EXAMPLE OF PROCESS TO SUBSCRIBE FOR A MONTHLY SUBSCRIPTON IN REAL LIFE
         1. sign up fo rmonthly subscription for package to be delivered
         2. the company would make the package behind the scene
         3. receive the package at your front door
         4. make sure the box isn't damaged
         5. open and make sure the item is correct
         6. use the item
         7. cancellable at any time
         */
        
        // 1. create the publisher
        URLSession.shared.dataTaskPublisher(for: url)
        // 2. subscribe the publisher on background thread
            .subscribe(on: DispatchQueue.global(qos: .background))
        // 3. receive on main thread
            .receive(on: DispatchQueue.main)
        // 4. tryMap (check that the data is good
            .tryMap(handleOutput)
        // 5. decode (decode data into PostModel)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
        // 6. sink (put the item into our app)
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            })
        // 7. store (cancel subscription if needed)
            .store(in: &cancellables)

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}

struct DownloadWithCombine: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct DownloadWithCombine_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombine()
    }
}
