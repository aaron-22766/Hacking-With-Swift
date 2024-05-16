//
//  ContentView.swift
//  Unit Converter
//
//  Created by Aaron Rabenstein on 16.05.24.
//

import SwiftUI

struct ContentView: View {
    
    private let units: [String: [Dimension]] = [
        "Time": [
            UnitDuration.seconds,
            UnitDuration.minutes,
            UnitDuration.hours
        ],
        "Length": [
            UnitLength.meters,
            UnitLength.kilometers,
            UnitLength.feet,
            UnitLength.yards,
            UnitLength.miles
        ],
        "Volume": [
            UnitVolume.milliliters,
            UnitVolume.liters,
            UnitVolume.centiliters,
            UnitVolume.pints,
            UnitVolume.gallons
        ],
        "Temperature": [
            UnitTemperature.celsius,
            UnitTemperature.fahrenheit,
            UnitTemperature.kelvin
        ]
    ]
    

    @State private var fromUnits: [String: Dimension] = [
        "Temperature": UnitTemperature.celsius,
        "Length": UnitLength.kilometers,
        "Time": UnitDuration.seconds,
        "Volume": UnitVolume.milliliters,
    ]
    
    @State private var toUnits: [String: Dimension] = [
        "Temperature": UnitTemperature.fahrenheit,
        "Length": UnitLength.meters,
        "Time": UnitDuration.minutes,
        "Volume": UnitVolume.liters,
    ]
    
    @State private var unitType = "Time"
    @State private var value: Double? = nil

    @FocusState private var textfieldFocused: Bool
    
    private var result: Measurement<Dimension>? {
        guard let value, let fromUnit = fromUnits[unitType], let toUnit = toUnits[unitType] else {
            return nil
        }
        return Measurement(value: value, unit: fromUnit).converted(to: toUnit)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("What do you want to convert?") {
                    Picker("Unit type", selection: $unitType) {
                        ForEach(Array(units.keys).sorted(by: { $0.count < $1.count }) , id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("From") {
                    Picker("From", selection: $fromUnits[unitType]) {
                        ForEach(units[unitType]!, id: \.self) {
                            Text($0.symbol).tag($0 as Dimension?)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("To") {
                    Picker("To", selection: $toUnits[unitType]) {
                        ForEach(units[unitType]!, id: \.self) {
                            Text($0.symbol).tag($0 as Dimension?)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Value") {
                    TextField("Value", value: $value, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($textfieldFocused)
                        .onLongPressGesture(minimumDuration: 0.0) {
                            textfieldFocused = true
                        }
                        .autocorrectionDisabled()
                }
                Section("Result") {
                    if let result {
                        Text(result.formatted())
                    } else {
                        Text("-")
                    }
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                if textfieldFocused {
                    Button("Done") {
                        textfieldFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
