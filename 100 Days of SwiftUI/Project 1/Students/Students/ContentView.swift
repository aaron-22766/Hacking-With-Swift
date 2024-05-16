//
//  ContentView.swift
//  Students
//
//  Created by Aaron Rabenstein on 15.05.24.
//

import SwiftUI

struct ContentView: View {
    @State private var students = ["Harry", "Ron", "Hermione"]
    @State private var selected = "Harry"
    @State private var name = ""
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Select or add a student")) {
                    Picker("Select your student", selection: $selected) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Enter student name", text: $name)
                    Button("Add \(name.isEmpty ? "student" : name) to selection") {
                        if name.isEmpty == false && students.contains(name) == false {
                            students.append(name)
                        }
                        name = ""
                    }
                }
                
                Section(header: Text("Students at Hogwarts")) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                
            }
            .navigationTitle("Students")
        }
    }
}

#Preview {
    ContentView()
}
