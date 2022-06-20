//
//  ContentView.swift
//  Project-01-WeSplit
//
//  Created by Ewanfo Lucky Peter on 20/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    let students = ["Harry", "Maguire", "John", "Peter"]
    
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = ""
    
    var body: some View {
        
        NavigationView{
            Form{
                TextField("Enter your name", text: $name)
                Text("Your name is: \(name)")
                Picker("Select a student", selection: $selectedStudent){
                    ForEach(students, id: \.self){ (name) in
                        Text(name)
                    }
                }
                Button("Tap Count & Reset \(tapCount)"){
                    tapCount += 1
                    name = ""
                }
                
            }
            .navigationTitle("Swift Ui")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
