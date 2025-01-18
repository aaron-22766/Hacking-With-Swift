//
//  ContentView.swift
//  Word Scramble
//
//  Created by Aaron Rabenstein on 09.07.24.
//

import SwiftUI
import VariableBlur

struct HighScore {
    var score: Int = 0
    var word: String = ""
}

struct ContentView: View {
    
    @State private var allWords = [String]()
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var highScore = HighScore()
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @FocusState var textFieldFocus: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(stops: [
                .init(color: .orange, location: 0),
                .init(color: .orange.opacity(0.3), location: 0.4),
                .init(color: Color("background"), location: 1)
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("WordScramble")
                    .font(.largeTitle.bold())
                
                if highScore.score > 0 {
                    HStack {
                        Color.clear
                            .frame(width: 60, height: 60)
                        
                        Spacer()
                        
                        VStack {
                            Text("Highscore")
                                .foregroundStyle(.secondary)
                                .font(.caption)
                            Text("\(highScore.score) \(highScore.word)")
                                .font(.title2)
                        }
                        .frame(height: 60)
                        .padding(.horizontal)
                        .background(Color("elements"))
                        .cornerRadius(15)
                        .foregroundStyle(.orange)
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                highScore.score = 0
                                highScore.word = ""
                            }
                        } label: {
                            Image(systemName: "trash")
                                .frame(width: 60, height: 60)
                                .background(Color("elements"))
                                .cornerRadius(30)
                                .foregroundStyle(.orange)
                                .font(.system(size: 23))
                        }
                        
                    }
                    .bold()
                }
                
                Text("Build as many words as you can from the letters of this word.")
                    .foregroundStyle(.secondary)
                    .font(.caption.bold())
                
                HStack {
                    
                    VStack {
                        Text("Score")
                            .foregroundStyle(.secondary)
                            .font(.caption)
                        Text("\(score)")
                            .font(.title2)
                    }
                    .frame(width: 60, height: 60)
                    .background(Color("elements"))
                    .cornerRadius(15)
                    
                    Spacer()
                    
                    Text(rootWord)
                        .font(.largeTitle)
                        .frame(width: 220, height: 60)
                        .background(Color("elements"))
                        .cornerRadius(15)
                    
                    Spacer()
                    
                    Button {
                        newRootWord()
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                            .frame(width: 60, height: 60)
                            .background(.orange)
                            .cornerRadius(30)
                            .foregroundStyle(.white)
                            .font(.system(size: 23))
                    }
                    
                }
                .bold()

                    
                ScrollView {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                            Spacer()
                        }
                        .padding()
                        .background(Color("elements"))
                        .cornerRadius(15)
                    }
                }
                .defaultScrollAnchor(.bottom)

                
                
                if showingError {
                    HStack(spacing: 10) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 30))
                        VStack(alignment: .leading) {
                            Text(errorTitle)
                                .font(.title2.bold())
                            Text(errorMessage)
                                .font(.caption)
                                .foregroundStyle(.black.opacity(0.5))
                        }
                        Spacer()
                        Button {
                            withAnimation {
                                showingError = false
                                newWord = ""
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                        }
                        .font(.system(size: 20))
                        .foregroundStyle(.black.opacity(0.5))
                    }
                    .padding()
                    .background(.yellow)
                    .foregroundStyle(.black)
                    .cornerRadius(15)
                }
                
                ZStack {
                    TextField("Enter your word", text: $newWord, axis: .vertical)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .keyboardType(.asciiCapable)
                        .focused($textFieldFocus)
                        .submitLabel(.go)
                        .onChange(of: textFieldFocus) {
                            if textFieldFocus {
                                withAnimation {
                                    newWord = ""
                                    showingError = false
                                }
                            }
                        }
                        .onChange(of: newWord) { oldValue, newValue in
                            if newValue.contains("\n") {
                                newWord = oldValue
                                addNewWord()
                                return
                            }
                            if newValue.count > 8 {
                                newWord = oldValue
                            }
                        }
                    
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                textFieldFocus = false
                            }
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                        .foregroundStyle(Color("swapped"))
                        .font(.system(size: 20))
                    }
                    .opacity(textFieldFocus ? 1 : 0)
                }
                .padding(15)
                .background(.orange.opacity(0.3))
                .cornerRadius(15)
            }
            .padding()
            .onAppear(perform: startGame)
            .onSubmit(addNewWord)
        }
        
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            showingError = false
            return
        }
        
        guard answer != rootWord else {
            wordError(title: "Word is root word", message: "Now you're just lazy!")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            showingError = false
            usedWords.append(answer)
            score += newWord.count
            newWord = ""
        }
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt")  {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
                newRootWord()
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func newRootWord() {
        withAnimation {
            if score > highScore.score {
                highScore.score = score
                highScore.word = rootWord
            }
            rootWord = allWords.randomElement() ?? "silkworm"
            score = 0
            usedWords.removeAll()
            showingError = false
            newWord = ""
            textFieldFocus = false
        }
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        guard word.count > 1 else {
            return ["a", "i", "o"].contains(word)
        }
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    ContentView()
}
