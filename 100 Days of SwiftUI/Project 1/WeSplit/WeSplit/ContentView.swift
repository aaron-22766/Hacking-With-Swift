//
//  ContentView.swift
//  WeSplit
//
//  Created by Aaron Rabenstein on 15.05.24.
//

import SwiftUI

struct ContentView: View {
    private let tipPercentages = [10, 15, 20, 25, -1]

    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipSelected: Int = 20
    @State private var tipCustom: Int = 20
    
    @FocusState private var fieldIsFocus: Bool

    private var tipPercentage: Int {
        tipSelected == -1 ? tipCustom : tipSelected
    }
    private var tipAmount: Double {
        checkAmount * Double(tipPercentage) / 100
    }
    private var totalCost: Double {
        checkAmount + tipAmount
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("How much was the bill?") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($fieldIsFocus)
                }
                Section("Split the bill?") {
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1...100, id: \.self) {
                            Text($0 == 1 ? "Pay in full" : "\($0) people")
                        }
                    }
                    .pickerStyle(.wheel)
                }
                Section("How much do you want to tip?") {
                    Picker("Select tip percentage", selection: $tipSelected) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0 == -1 ? "Custom" : "\($0, format: .percent)")
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    if tipSelected == -1 {
                        TextField("Tip percentage", value: $tipCustom, format: .percent)
                            .keyboardType(.decimalPad)
                            .focused($fieldIsFocus)
                    }
                }
                Section("Result") {
                    Text("Tip: \(tipAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    Text("Total: \(totalCost, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    if numberOfPeople > 1 && totalCost != 0.0 {
                        Text("Each: \(totalCost / Double(numberOfPeople), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    }
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if fieldIsFocus {
                    Button("Done") {
                        fieldIsFocus = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
