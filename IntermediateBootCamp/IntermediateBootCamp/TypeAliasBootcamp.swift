//
//  TypeAliasBootcamp.swift
//  IntermediateBootCamp
//
//  Created by Spencer Hurd on 2/23/22.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypeAliasBootcamp: View {
    
//    @State var item: MovieModel = MovieModel(title: "Movie Title", director: "Joe", count: 5)
    @State var item: TVModel = TVModel(title: "TV Title", director: "Emily", count: 10)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypeAliasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypeAliasBootcamp()
    }
}
