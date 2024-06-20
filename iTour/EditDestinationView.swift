//
//  EditDestinationView.swift
//  iTour
//
//  Created by Vincent Senjaya on 19/06/24.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    
    @Bindable var destination: Destination
    @State private var newSightName = ""
    
    var body: some View {
        Form{
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            Section("Priority"){
                Picker("Priority", selection: $destination.priority){
                    Text("meh").tag(1)
                    Text("maybe").tag(2)
                    Text("must").tag(3)
                }.pickerStyle(.segmented)
            }
            Section("Sights") {
                ForEach(destination.sights) { sight in
                    Text(sight.name)
                }
                HStack {
                    TextField("Add a new sight in \(destination.name)", text: $newSightName)
                    Button("Add", action: addSight)
                }
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addSight(){
        guard newSightName.isEmpty == false else {return}
        withAnimation{
            let sight = Sight(name: newSightName)
            destination.sights.append(sight)
            newSightName = ""
        }
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "example destination", details: "Example details go here and will automatically expand")
        return EditDestinationView(destination: example).modelContainer(container)
    } catch{
        fatalError("failed bro")
    }
}
