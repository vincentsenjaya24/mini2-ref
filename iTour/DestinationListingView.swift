//
//  DestinationListingView.swift
//  iTour
//
//  Created by Vincent Senjaya on 20/06/24.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    @Environment (\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destinations: [Destination]   

    var body: some View {
        List{
            ForEach(destinations){ destination in
                NavigationLink(value: destination){
                    VStack(alignment: .leading){
                        Text(destination.name).font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }.onDelete(perform: deleteDestinations)
        }
    }
    init(sort: SortDescriptor<Destination>){
        _destinations = Query(sort: [sort])
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name))
}
