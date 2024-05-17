//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Aaron Rabenstein on 16.05.24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var guessedCountry = 0
    @State private var showScore = false
    @State private var showResult = false
    @State private var scoreTitle = ""
    @State private var round = 1
    @State private var score = 0
    
    var result: String {
        switch score {
        case 8: "Wow, you must me a PRO!!!"
        case 7: "Well Done!"
        case 5...6: "Pretty good."
        case 3...4: "There's room to grow."
        default: "Well that wasn't a round to be proud of."
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color("background.gradient.top"), location: 0),
                .init(color: Color("background.gradient.bottom"), location: 1)
            ], center: .topLeading, startRadius: 50, endRadius: 1000)
                .ignoresSafeArea()
            HStack(alignment: .bottom) {
                VStack(spacing: 10) {
                    Spacer()
                        .frame(maxHeight: 50)
                    Text("Guess the Flag")
                        .font(.largeTitle.bold())
                        .foregroundColor(.primary)
                    HStack(spacing: 10) {
                        Text("Round \(round)/8")
                            .font(.headline.bold())
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.ultraThinMaterial)
                            .clipShape(.capsule)
                        Text("Score: \(score)")
                            .font(.headline.bold())
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.ultraThinMaterial)
                            .clipShape(.capsule)
                        Button(role: .destructive) {
                            restartGame()
                        } label: {
                            Image(systemName: "arrow.counterclockwise.circle")
                                .imageScale(.large)
                        }
                        .font(.headline.bold())
                        .frame(maxWidth: 50, maxHeight: .infinity)
                        .background(.ultraThinMaterial)
                        .clipShape(.capsule)
                    }
                    .frame(height: 50)
                    Spacer()
                    VStack(spacing: 20) {
                        VStack {
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.bold))
                            Text(countries[correctAnswer])
                                .foregroundStyle(.primary)
                                .font(.largeTitle.weight(.bold))
                        }
                        
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                            }
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                    .cornerRadius(40)
                }
                .padding(30)
            }
            .ignoresSafeArea()
        }

        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("That's the flag of \(countries[guessedCountry]).")
        }
        
        .alert("\(result)", isPresented: $showResult) {
            Button("New Game", role: .cancel, action: restartGame)
        } message: {
            Text("You guessed \(score) out of 8 games correctly.")
        }
    }

    func flagTapped(_ number: Int) {
        guessedCountry = number
        if guessedCountry == correctAnswer {
            score += 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        if round == 8 {
            showResult = true
        } else {
            showScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        round += 1
    }
    
    func restartGame() {
        askQuestion()
        round = 1
        score = 0
    }
}

#Preview {
    ContentView()
}
