//
//  ContentView.swift
//  BetterRest
//
//  Created by Aaron Rabenstein on 19.05.24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 0
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var idealBedtime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep

            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "Error"
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(stops: [
                    .init(color: Color("TopGradient"), location: 0.05),
                    .init(color: Color("BottomGradient"), location: 0.55)
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    Spacer()
                    VStack {
                        Text("You should go to bed at")
                            .font(.headline)
                        Text(idealBedtime)
                            .font(.system(size: 60, weight: .semibold, design: .rounded))
                    }
                    .padding(25)
                    .background(Color("ContentBackground"))
                    .cornerRadius(12)
                    Spacer()
                    Form {
                        HStack(alignment: .center, spacing: 0) {
                            Text("When do you want to wake up?")
                                .font(.headline)
                            Spacer()
                            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                        .padding(10)
                        .listRowBackground(Color(white: 1, opacity: 0.1))
                        Section {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Desired amount of sleep")
                                    .font(.headline)
                                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                            }
                        }
                        .padding(10)
                        .listRowBackground(Color(white: 1, opacity: 0.1))
                        Section {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Daily coffee intake")
                                    .font(.headline)
                                Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 0...20)
                            }
                        }
                        .padding(10)
                        .listRowBackground(Color(white: 1, opacity: 0.1))
                    }
                    .frame(maxHeight: 400)
                    .scrollDisabled(true)
                    .background(.clear)
                    .scrollContentBackground(.hidden)
                }
                .navigationTitle("BetterRest")
            }
        }
    }
}

#Preview {
    ContentView()
}
