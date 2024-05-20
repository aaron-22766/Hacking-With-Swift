//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Aaron Rabenstein on 18.05.24.
//

import SwiftUI

struct ItemButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 60))
            .padding()
            .background(.regularMaterial)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.white, lineWidth: 3)
            )
    }
    
}

extension View {
    
    func itemButtonStyle() -> some View {
        modifier(ItemButtonStyle())
    }
    
}

struct ContentView: View {
    
    let items = ["🪨", "📄", "✂️"]
    
    @State private var gameItem = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var round = 1
    @State private var showResult = false
    @State private var rightGuess = 0 {
        didSet {
            
        }
    }
    @State private var wrongGuess = 0
    
    var score: Int {
        rightGuess - wrongGuess
    }
    var result: String {
        switch score {
        case 8...10: "Wow you are a PRO at this!"
        case 5...7: "Pretty good!"
        case 1...4: "You could've done better!"
        case -3...0: "Did you even try?"
        default: "Even a randomizer wouldn't be as bad as you!"
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Text("Rock Paper Scissors")
                .font(.largeTitle.bold())
                .frame(maxHeight: 160)
            VStack(spacing: 10) {
                HStack(spacing: 20) {
                    Text("Score: \(score)")
                    Spacer()
                    Button(role: .destructive) {
                        restartGame()
                    } label: {
                        Image(systemName: "arrow.counterclockwise.circle")
                    }
                }
                .font(.title.bold())
                HStack {
                    Text("Tap one of the items so that your item wins or looses against the displayed item depending on the label below.")
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                Spacer()
                    .frame(maxHeight: 125)
                Text("Round \(round)/10")
                    .font(.title.bold())
                VStack {
                    Text(items[gameItem])
                        .font(.system(size: 100))
                    Text("You need to")
                        .font(.title2)
                    Text(shouldWin ? "Win" : "Loose")
                        .font(.title2.bold())
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.3))
                .cornerRadius(30)
            }
            .padding()
            .frame(maxWidth: 350)
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            Spacer()
            HStack(alignment: .bottom) {
                Spacer()
                ForEach(0..<items.count, id: \.self) { item in
                    Button(items[item]) {
                        itemTapped(item)
                    }
                    .itemButtonStyle()
                    Spacer()
                }
            }
            Spacer()
                .frame(height: 15)
        }
        .padding()
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AngularGradient(stops: [
            .init(color: .orange, location: 0),
            .init(color: .orange, location: 0.05),
            .init(color: .yellow, location: 0.25),
            .init(color: .green, location: 0.45),
            .init(color: .green, location: 0.5)
        ], center: .top).ignoresSafeArea())
        
        .alert("\(result)", isPresented: $showResult) {
            Button("New Game") {
                restartGame()
            }
        } message: {
            Text("You ended up with a score of:\n\(score)\nThat means:\n\(rightGuess) correct guesses\n\(wrongGuess) wrong guesses\n\(10 - rightGuess - wrongGuess) draws")
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    
    func itemTapped(_ item: Int) {
        if item != gameItem {
            let fight = switch gameItem {
            case 0: item == 1 // wins rock vs paper
            case 1: item == 2 //wins paper vs scissors
            case 2: item == 0//wins scissors vs rock
            default: false
            }
            if fight == shouldWin {
                rightGuess += 1
            } else {
                wrongGuess += 1
            }
        }
        if round == 10 {
            showResult = true
        } else {
            nextRound()
        }
    }
    
    func nextRound() {
        round += 1
        gameItem = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    func restartGame() {
        round = 0
        rightGuess = 0
        wrongGuess = 0
        nextRound()
    }
}


#Preview {
    ContentView()
}
